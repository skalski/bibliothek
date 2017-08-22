<?php

namespace bibliothek;

include 'bootstrap.php';

use bibliothek\library\DomLoader;

$xsl = new \DOMDocument();
$xsl->load(__DIR__ . '/template/magix.xsl');

$xml = new \DOMDocument();
$xml->load(__DIR__ . '/data/data.xml');

if(isset($_REQUEST['sort'])){
    $sort = explode('|',$_REQUEST['sort'])[1];
    $sortOrder = explode('|',$_REQUEST['sort'])[0];
} else {
    $sort = 'author';
    $sortOrder = 'descending';
}


$xml->documentElement->setAttribute('searchTerm', (isset($_REQUEST['searchTerm']) ? $_REQUEST['searchTerm'] : ''));
$xml->documentElement->setAttribute('sort', $sort);
$xml->documentElement->setAttribute('sortOrder', $sortOrder);

$xslProcessor = new \XSLTProcessor();
$xslProcessor->importStylesheet($xsl);
echo $xslProcessor->transformToXml($xml);



exit();
