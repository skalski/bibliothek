<?php

namespace bibliothek;

include 'bootstrap.php';


$xsl = new \DOMDocument();
$xsl->load(__DIR__ . '/template/magix.xsl');

$xml = new \DOMDocument();
$xml->load(__DIR__ . '/data/data.xml');

$xml->documentElement->setAttribute('foo', $_GET['foo']);

$xslProcessor = new \XSLTProcessor();
$xslProcessor->importStylesheet($xsl);
echo $xslProcessor->transformToXml($xml);



exit();

use bibliothek\library\DomLoader;
use bibliothek\library\Render;

if(!isset($_REQUEST['searchTerm'])){
    $searchTerm = null;
} else {
    $searchTerm = $_REQUEST['searchTerm'];
}

if(!isset($_REQUEST['sort'])){
    $sort = null;
} else {
    $sort = $_REQUEST['sort'];
}

$data = new DomLoader('./data/data.xml');
$dataStorage = $data->getDocument();
$dataStorageItems = simplexml_load_string($dataStorage->saveXML());

if($searchTerm && !empty($searchTerm)) {
    $dataStorageItems = $dataStorageItems->xpath('//text()[contains(., "'.$searchTerm.'")]/ancestor::book');
}

$dataSetTemplates = array();
foreach ($dataStorageItems as $dataStorageItem)
{
    $row = new Render("./template/row.tpl");
    foreach ($dataStorageItem as $key => $value) {
        $row->set($key, strip_tags ($value->saveXML()));
    }
    $dataSetTemplates[] = $row;
}

$dataTemplate = Render::merge($dataSetTemplates);


$bookList  = new Render("./template/table.tpl");
$bookList->set("dataset", $dataTemplate);

$render = new Render("./template/page.tpl");
$render->set("table", $bookList->output());
$render->set("searchTerm", $searchTerm);

echo $render->output();
