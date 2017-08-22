<?php
$xsl = new \DOMDocument();
$xsl->load(__DIR__ . '/template/magix.xsl');

$xml = new \DOMDocument();
$xml->load(__DIR__ . '/data/data.xml');

if(isset($_REQUEST['sort'])){
    $sort = explode('|',$_REQUEST['sort'])[1];
    $sortOrder = explode('|',$_REQUEST['sort'])[0];
} else {
    $sort = 'number(price)';
    $sortOrder = 'ascending';
}


$xml->documentElement->setAttribute('searchTerm', (isset($_REQUEST['searchTerm']) ? $_REQUEST['searchTerm'] : ''));
$xml->documentElement->setAttribute('sort', $sort);
$xml->documentElement->setAttribute('sortOrder', $sortOrder);
$xml->documentElement->setAttribute('sortValue', (isset($_REQUEST['sort']) ? $_REQUEST['sort'] : ''));
$xml->documentElement->setAttribute('minPrice',(isset($_REQUEST['minPrice']) ? $_REQUEST['minPrice'] : '0') );
$xml->documentElement->setAttribute('maxPrice',(isset($_REQUEST['maxPrice']) ? $_REQUEST['maxPrice'] : '1000') );

$xslProcessor = new \XSLTProcessor();
$xslProcessor->importStylesheet($xsl);
echo $xslProcessor->transformToXml($xml);



exit();
