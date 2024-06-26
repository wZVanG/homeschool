<?php
/**
 * This file is part of the SetaPDF-Core Component
 *
 * @copyright  Copyright (c) 2020 Setasign GmbH & Co. KG (https://www.setasign.com)
 * @category   SetaPDF
 * @package    SetaPDF_Core
 * @subpackage Document
 * @license    https://www.setasign.com/ Commercial
 * @version    $Id: Extensions.php 1409 2020-01-30 14:40:05Z jan.slabon $
 */

/**
 * Class for handling the catalogs extensions dictionary
 *
 * @copyright  Copyright (c) 2020 Setasign GmbH & Co. KG (https://www.setasign.com)
 * @category   SetaPDF
 * @package    SetaPDF_Core
 * @subpackage Document
 * @license    https://www.setasign.com/ Commercial
 */
class SetaPDF_Core_Document_Catalog_Extensions
{
    /**
     * The catalog instance
     *
     * @var SetaPDF_Core_Document_Catalog
     */
    protected $_catalog;

    /**
     * The constructor.
     *
     * @param SetaPDF_Core_Document_Catalog $catalog
     */
    public function __construct(SetaPDF_Core_Document_Catalog $catalog)
    {
        $this->_catalog = $catalog;
    }

    /**
     * Release memory and cycled references.
     */
    public function cleanUp()
    {
        $this->_catalog = null;
    }

    /**
     * Get the extensions dictionary.
     *
     * @param bool $create
     * @return null|SetaPDF_Core_Type_Dictionary
     */
    public function getDictionary($create = false)
    {
        $root = $this->_catalog->getDictionary($create);
        if (null === $root) {
            return null;
        }

        if (!$root->offsetExists('Extensions')) {
            if ($create === false) {
                return null;
            }

            $root->offsetSet('Extensions', new SetaPDF_Core_Type_Dictionary());
        }

        return $root->getValue('Extensions')->ensure(true);
    }

    /**
     * Get all defined developer extensions.
     *
     * The method will return an array of the following structure:
     * [$name => [baseVersion => "...", extensionLevel => "..."], ...]
     *
     * @return array
     */
    public function getExtensions()
    {
        $result = [];
        $dictionary = $this->getDictionary();
        if ($dictionary === null) {
            return $result;
        }

        /**
         * @var $values SetaPDF_Core_Type_Dictionary
         */
        foreach ($dictionary AS $name => $values) {
            $result[$name] = [
                'baseVersion' => $values->getValue('BaseVersion')->getValue(),
                'extensionLevel' => (int)$values->getValue('ExtensionLevel')->getValue()
            ];
        }

        return $result;
    }

    /**
     * Get a developer extension by its name.
     *
     * This method will return an array with the "baseVersion" and "extensionLevel" keys or false
     * if no extension was found.
     *
     * @param string $name
     * @return array|bool
     */
    public function getExtension($name)
    {
        $dictionary = $this->getDictionary();
        if ($dictionary === null || !$dictionary->offsetExists($name)) {
            return false;
        }

        /**
         * @var $values SetaPDF_Core_Type_Dictionary
         */
        $values = $dictionary->getValue($name);
        return [
            'baseVersion' => $values->getValue('BaseVersion')->getValue(),
            'extensionLevel' => (int)$values->getValue('ExtensionLevel')->getValue()
        ];
    }

    /**
     * Set the data of a developer extension.
     *
     * @param string $name
     * @param string $baseVersion
     * @param integer $extensionLevel
     */
    public function setExtension($name, $baseVersion, $extensionLevel)
    {
        $dictionary = $this->getDictionary(true);
        $dictionary[$name] = new SetaPDF_Core_Type_Dictionary([
            'BaseVersion' => new SetaPDF_Core_Type_Name($baseVersion),
            'ExtensionLevel' => new SetaPDF_Core_Type_Numeric((int)$extensionLevel)
        ]);
    }

    /**
     * Removes a developer extension from the dictionary.
     *
     * @param string $name
     * @return bool
     */
    public function removeExtension($name)
    {
        $dictionary = $this->getDictionary();
        if ($dictionary === null || !$dictionary->offsetExists($name)) {
            return false;
        }

        $dictionary->offsetUnset($name);

        return true;
    }
}