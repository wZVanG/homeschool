<?php


require_once('library/SetaPDF/Autoload.php');
// or if you use composer require_once('vendor/autoload.php');



$reader = new SetaPDF_Core_Reader_File('memo.pdf');
$writer = new SetaPDF_Core_Writer_File('memo2.pdf');
$document = SetaPDF_Core_Document::load($reader, $writer);

/*// create a Http writer
$writer = new SetaPDF_Core_Writer_Http('memo.pdf', true);
// load document by filename
$document = SetaPDF_Core_Document::loadByFilename('memo.pdf', $writer);*/

// create a signer instance for the document
$signer = new SetaPDF_Signer($document);

// set some signature properties
/*$signer->setReason('Just for testing');
$signer->setLocation('setasign.com');
$signer->setContactInfo('+49 5351 523901-0');*/


// create an OpenSSL module instance
$module = new SetaPDF_Signer_Signature_Module_OpenSsl();
// set the sign certificate
$module->setCertificate(file_get_contents('rosaelena2020.cer'));
// set the private key for the sign certificate
$module->setPrivateKey(array(file_get_contents('rosaelena2020.key'), 'Equicomx12'));



// create a visible signature field
$signer->addSignatureField(
    SetaPDF_Signer_SignatureField::DEFAULT_FIELD_NAME,
    1,
    SetaPDF_Signer_SignatureField::POSITION_RIGHT_TOP,
    array('x' => -30, 'y' => -100),
    90,
    45
);

// create the appearance
$appearance = new SetaPDF_Signer_Signature_Appearance_Dynamic($module);


// disable the distinguished name
$appearance->setShow(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_DISTINGUISHED_NAME, false);
//$appearance->setShow(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_NAME, false);
$appearance->setShow(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_LOCATION,false);
$appearance->setShow(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_REASON,false);
//$appearance->setShow(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_DATE,true);


// format the date
$appearance->setShowTpl(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_NAME,'Firmado Digitalmente por: %s');
$appearance->setShowFormat(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_DATE, 'd/m/Y H:i:s');
$appearance->setShowTpl(SetaPDF_Signer_Signature_Appearance_Dynamic::CONFIG_DATE, 'Fecha: %s');


// set the photo xObject as graphic
$appearance->setGraphic(false);

// define the appearance
$signer->setAppearance($appearance);

// sign the document and send the final document to the initial writer

$signer->sign($module);