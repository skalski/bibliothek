<?php

namespace bibliothek;

include 'bootstrap.php';

use bibliothek\library\DomLoader;
use bibliothek\library\Render;

if(!isset($_REQUEST['searchTerm'])){
    $searchTerm = null;
} else {
    $searchTerm = $_REQUEST['searchTerm'];
}


$data = new DomLoader('./data/data.xml');
$dataStorage = $data->getDocument();
if($searchTerm) {
    $dataStorageItems = simplexml_load_string($dataStorage->saveXML());
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
