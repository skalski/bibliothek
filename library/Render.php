<?php

namespace bibliothek\library
{

    class Render
    {
        protected $file;

        protected $values = [];

        public function __construct($file)
        {
            $this->file = $file;
        }

        public function set($key, $value)
        {
            $this->values[$key] = $value;
        }

        public function output()
        {

            if (!file_exists($this->file)) {
                return "Error loading template file ($this->file).<br />";
            }
            $output = file_get_contents($this->file);

            foreach ($this->values as $key => $value) {
                $tagToReplace = "[@$key]";
                $output = str_replace($tagToReplace, $value, $output);
            }

            return $output;
        }

        static public function merge($templates, $separator = "\n")
        {
            $output = "";

            foreach ($templates as $template) {
                $content = $template->output();
                $output .= $content . $separator;
            }

            return $output;
        }
    }
}
