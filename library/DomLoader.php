<?php

namespace bibliothek\library
{

    class DomLoader
    {

        private $domDocument;

        private $file;

        function __construct($file)
        {
            $this->file = $file;
        }

        function getDocument(): \DOMDocument
        {
            return $this->loadDocument();

        }

        private function loadDocument(): \DOMDocument
        {
            $this->domDocument = new \DOMDocument();
            $this->domDocument->load($this->file);
            return $this->domDocument;
        }

    }
}
