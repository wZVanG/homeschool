<?php 
/**
 * This file is part of the SetaPDF-Core Component
 *
 * @copyright  Copyright (c) 2020 Setasign GmbH & Co. KG (https://www.setasign.com)
 * @category   SetaPDF
 * @package    SetaPDF_Core
 * @subpackage Document
 * @license    https://www.setasign.com/ Commercial
 * @version    $Id: Annotations.php 1489 2020-06-19 07:18:09Z jan.slabon $
 */

/**
 * Helper class for handling annotations of a page
 *
 * @copyright  Copyright (c) 2020 Setasign GmbH & Co. KG (https://www.setasign.com)
 * @category   SetaPDF
 * @package    SetaPDF_Core
 * @subpackage Document
 * @license    https://www.setasign.com/ Commercial
 */
class SetaPDF_Core_Document_Page_Annotations
{
    /**
     * Constant specifying the row tab order
     *
     * @var string
     */
    const TAB_ORDER_ROW = 'R';

    /**
     * Constant specifying the column tab order
     *
     * @var string
     */
    const TAB_ORDER_COLUMN = 'C';

    /**
     * Constant specifying the structure tab order
     *
     * @var string
     */
    const TAB_ORDER_STRUCTURE = 'S';

    /**
     * Constant specifying the annotations array tab order
     *
     * @var string
     */
    const TAB_ORDER_ANNOTATIONS_ARRAY = 'A';

    /**
     * Constant specifying the widget tab order
     *
     * @var string
     */
    const TAB_ORDER_WIDGET = 'W';

    /**
     * The page object
     * 
     * @var SetaPDF_Core_Document_Page
     */
    protected $_page;
    
    /**
     * The constructor.
     * 
     * @param SetaPDF_Core_Document_Page $page
     */
    public function __construct(SetaPDF_Core_Document_Page $page)
    {
        $this->_page = $page;
    }

    /**
     * Release memory/resources.
     */
    public function cleanUp()
    {
        $this->_page = null;
    }

    /**
     * Get the page.
     *
     * @return SetaPDF_Core_Document_Page
     */
    public function getPage()
    {
        return $this->_page;
    }
    
    /**
     * Returns the Annots array if available or creates a new one.
     *
     * @param boolean $create
     * @return false|SetaPDF_Core_Type_Array
     */
    public function getArray($create = false)
    {
        $pageDict = $this->_page->getPageObject(true)->ensure(true);
        $annots = $pageDict->offsetExists('Annots');

        if ($annots) {
            try {
                $annots = $pageDict->offsetGet('Annots')->ensure();
                if (!$annots instanceof SetaPDF_Core_Type_Array) {
                    $annots = false;
                }
            } catch (SetaPDF_Core_Type_IndirectReference_Exception $e) {
                $annots = false;
            }
        }

        if ($annots === false) {
        	if ($create === false) {
        		return false;
            }

            $annots = new SetaPDF_Core_Type_Array();
        	$pageDict->offsetSet('Annots', $annots);
        }

        return $annots;
    }
    
    /**
     * Get all annotations of this page.
     *
     * Optionally the results can be filtered by the subtype parameter.
     * 
     * @param string $subtype See {@link SetaPDF_Core_Document_Page_Annotation::TYPE_*} constants for possible values.
     * @return SetaPDF_Core_Document_Page_Annotation[]
     */
    public function getAll($subtype = null)
    {
        $annotations = [];
    	$annotationsArray = $this->getArray();
    	if ($annotationsArray === false) {
    		return $annotations;
        }
    
    	foreach ($annotationsArray AS $annotationValue) {
            /**
             * @var $annotationDictionary SetaPDF_Core_Type_Dictionary
             */
            try {
    		    $annotationDictionary = $annotationValue->ensure(true);
            } catch (SetaPDF_Core_Type_IndirectReference_Exception $e) {
                continue;
            }

    		if (
    		    $subtype === null ||
                SetaPDF_Core_Type_Dictionary_Helper::keyHasValue($annotationDictionary, 'Subtype', $subtype)
            ) {
    		    try {
    		        $annotation = SetaPDF_Core_Document_Page_Annotation::byObjectOrDictionary($annotationValue);
                } catch (InvalidArgumentException $e) {
    		        continue;
                }

    			$annotations[] = $annotation;
            }
    	}
    
    	return $annotations;
    }

    /**
     * Get an annotation by its name (NM entry)
     *
     * @param string $name The name of the annotation.
     * @param string $encoding
     *
     * @return bool|SetaPDF_Core_Document_Page_Annotation
     */
    public function getByName($name, $encoding = 'UTF-8')
    {
        $annotationsArray = $this->getArray();
        if ($annotationsArray === false) {
            return false;
        }

        foreach ($annotationsArray AS $annotationValue) {
            /**
             * @var $annotationDictionary SetaPDF_Core_Type_Dictionary
             */
            try {
                $annotationDictionary = $annotationValue->ensure(true);
            } catch (SetaPDF_Core_Type_IndirectReference_Exception $e) {
                continue;
            }

            if (!$annotationDictionary->offsetExists('NM')) {
                continue;
            }

            if (
                SetaPDF_Core_Encoding::convertPdfString(
                    $annotationDictionary->getValue('NM')->getValue(), $encoding
                ) === $name
            ) {
                return SetaPDF_Core_Document_Page_Annotation::byObjectOrDictionary($annotationValue);
            }
        }

        return false;
    }

    /**
     * Adds an annotation to the page.
     *
     * @param SetaPDF_Core_Document_Page_Annotation $annotation
     * @return SetaPDF_Core_Type_IndirectObjectInterface
     */
    public function add(SetaPDF_Core_Document_Page_Annotation $annotation)
    {
        $annotationsArray = $this->getArray(true);
        $object = $annotation->getIndirectObject();

        $pageObject = $this->getPage()->getPageObject(true);
        if ($object === null) {
            $document = $pageObject->getOwnerPdfDocument();
            $dictionary = $annotation->getDictionary();
            $object = $document->createNewObject($dictionary);
            $annotation->setIndirectObject($object);
        }

        $object->ensure()->offsetSet('P', $pageObject);

        $annotationsArray->offsetSet(null, $object);
        
        return $object;
    }

    /**
     * Removes an annotation from the annotation array of the page.
     *
     * @param SetaPDF_Core_Document_Page_Annotation $annotation
     * @return bool
     */
    public function remove(SetaPDF_Core_Document_Page_Annotation $annotation)
    {
        $annotationsArray = $this->getArray();
        if ($annotationsArray === false) {
            return false;
        }

        $object = $annotation->getIndirectObject();
        if ($object) {
            $document = $this->_page->getPageObject(true)->getOwnerPdfDocument();
            if ($document->getInstanceIdent() !== $object->getOwnerPdfDocument()->getInstanceIdent()) {
                return false;
            }

            foreach ($annotationsArray AS $key => $annotationValue) {
                if ($annotationValue instanceof SetaPDF_Core_Type_IndirectObjectInterface) {
                    if ($annotationValue->getObjectIdent() === $object->getObjectIdent()) {
                        $annotationsArray->offsetUnset($key);
                        return true;
                    }
                }
            }

        } else {
            $value = $annotation->getDictionary()->toPhp();

            foreach ($annotationsArray AS $key => $annotationValue) {
                if (!($annotationValue instanceof SetaPDF_Core_Type_IndirectObjectInterface)) {
                    if ($annotationValue->toPhp() === $value) {
                        $annotationsArray->offsetUnset($key);
                        return true;
                    }
                }
            }
        }

        return false;
    }

    /**
     * Get the tab order that shall be used for annotations on the page.
     *
     * @return string|null
     */
    public function getTabOrder()
    {
        /** @var SetaPDF_Core_Type_Dictionary $pageDict */
        $pageDict = $this->_page->getPageObject(true)->ensure(true);

        if (!$pageDict->offsetExists('Tabs')) {
            return null;
        }

        $tabs = $pageDict->getValue('Tabs')->ensure();

        return $tabs->getValue();
    }

    /**
     * Set the tab order that shall be used for annotations on the page.
     *
     * @param string|null $tabOrder
     */
    public function setTabOrder($tabOrder)
    {
        /**
         * @var SetaPDF_Core_Type_Dictionary $pageDict
         */
        $pageDict = $this->_page->getPageObject(true)->ensure(true);

        if (null === $tabOrder) {
            $pageDict->offsetUnset('Tabs');
            return;
        }

        $pageDict->offsetSet('Tabs', new SetaPDF_Core_Type_Name($tabOrder));
    }
}