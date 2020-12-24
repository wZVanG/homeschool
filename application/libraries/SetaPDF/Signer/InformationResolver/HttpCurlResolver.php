<?php
/**
 * This file is part of the SetaPDF-Signer Component
 *
 * @copyright  Copyright (c) 2020 Setasign GmbH & Co. KG (https://www.setasign.com)
 * @category   SetaPDF
 * @package    SetaPDF_Signer
 * @license    https://www.setasign.com/ Commercial
 * @version    $Id$
 */

use SetaPDF_Signer_ValidationRelatedInfo_LoggerInterface as LoggerInterface;
use SetaPDF_Signer_ValidationRelatedInfo_Logger as Logger;

/**
 * Resolver for HTTP(s) using CURL functions.
 *
 * @copyright  Copyright (c) 2020 Setasign GmbH & Co. KG (https://www.setasign.com)
 * @category   SetaPDF
 * @package    SetaPDF_Signer
 * @license    https://www.setasign.com/ Commercial
 */
class SetaPDF_Signer_InformationResolver_HttpCurlResolver
    implements SetaPDF_Signer_InformationResolver_ResolverInterface
{
    /**
     * Curl options.
     *
     * @var array
     */
    protected $_curlOptions = [];

    /**
     * A logger instance.
     *
     * @var LoggerInterface
     */
    protected $_logger;

    /**
     * The constructor.
     *
     * @param array $curlOptions See https://www.php.net/curl-setopt
     */
    public function __construct(array $curlOptions = [])
    {
        $this->setCurlOptions($curlOptions);
    }

    /**
     * @inheritDoc
     */
    public function setLogger(LoggerInterface $logger)
    {
        $this->_logger = $logger;
    }

    /**
     * Get the logger instance.
     *
     * If no logger instance was passed before a new instance of {@link SetaPDF_Signer_ValidationRelatedInfo_Logger} is
     * returned.
     *
     * @return SetaPDF_Signer_ValidationRelatedInfo_LoggerInterface
     */
    public function getLogger()
    {
        if ($this->_logger === null) {
            $this->_logger = new Logger();
        }

        return $this->_logger;
    }

    /**
     * Set options for the cURL transfer.
     *
     * @param array $curlOptions The curl options.
     * @see https://www.php.net/curl-setopt
     */
    public function setCurlOptions(array $curlOptions)
    {
        $this->_curlOptions = $curlOptions;
    }

    /**
     * Get the cURL transfer options.
     *
     * @return array
     */
    public function getCurlOptions()
    {
        return $this->_curlOptions;
    }

    /**
     * @inheritDoc
     */
    public function accepts($uri)
    {
        $schema = strtolower(parse_url($uri, PHP_URL_SCHEME));
        return ($schema === 'http' || $schema === 'https');
    }

    /**
     * @inheritDoc
     * @throws SetaPDF_Signer_Exception
     */
    public function resolve($uri = null)
    {
        $curl = curl_init();
        $curlOptions = $this->getCurlOptions();
        if ($uri !== null) {
            $curlOptions[CURLOPT_URL] = $uri;
        }
        if (!isset($curlOptions[CURLOPT_HTTPHEADER])) {
            $curlOptions[CURLOPT_HTTPHEADER] = [
                'Pragma: no-cache'
            ];
        }

        $curlOptions[CURLOPT_RETURNTRANSFER] = true;

        curl_setopt_array($curl, $curlOptions);

        $this->getLogger()
            ->increaseDepth()
            ->log('Try to resolve data from URI "{uri}".', ['uri' => $curlOptions[CURLOPT_URL]]);

        $lastResponse = curl_exec($curl);
        if ($lastResponse === false) {
            $error = curl_error($curl);
            curl_close($curl);

            $this->getLogger()->log('Error in cURL: "{errorMessage}".', ['errorMessage' => $error]);

            throw new SetaPDF_Signer_Exception('cURL error: ' . $error);
        }

        $httpStatus = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        if ($httpStatus !== 200) {
            curl_close($curl);

            $this->getLogger()->log(
                'Unexpected HTTP status for URI "{uri}": {httpStatus}.',
                ['uri' => $curlOptions[CURLOPT_URL], 'httpStatus' => $httpStatus]
            );

            throw new SetaPDF_Signer_Exception(
                sprintf('Unexpected HTTP status for URI "%s": %s', $curlOptions[CURLOPT_URL], $httpStatus)
            );
        }

        $contentType = curl_getinfo($curl, CURLINFO_CONTENT_TYPE);
        curl_close($curl);

        $this->getLogger()->log(
            'Received {byteCount} bytes with the content-type "{contentType}".',
            ['byteCount' => strlen($lastResponse), 'contentType' => $contentType]
        )->decreaseDepth();

        return [$contentType, $lastResponse];
    }
}
