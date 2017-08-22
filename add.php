<?php
$xml = new \DOMDocument();
$xml->load(__DIR__ . '/data/data.xml');

$original = new SimpleXMLElement($xml->saveXML());

if(!is_float($_REQUEST['bookPrice'])){
    echo "Price of Book is not a decimal Number - Abort!";
    exit;
}

if(!validateDate($_REQUEST['bookPublish_date'])){
    echo "Publish Date of Book is not valid - Abort!";
    exit;
}

$newBook = $original->addChild('book');
foreach ($_REQUEST as $key => $formData) {
    if($formData == ''){
        echo str_replace('book','',$key)." is empty - Abort!";
        exit;
    }
    $newBook->addChild(strtolower(str_replace('book','',$key)), $formData);
}
file_put_contents(__DIR__ . '/data/data.xml', $original->saveXML(), LOCK_EX);
echo "Congrats, your Book is stored.";

function validateDate($date, $format = 'Y-m-d')
{
    $d = DateTime::createFromFormat($format, $date);
    return $d && $d->format($format) == $date;
}
