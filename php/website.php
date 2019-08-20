<?php
require_once(realpath(__DIR__ . '/../vendor/autoload.php'));

function get_title() {
    return implode('', alphabet());
}
