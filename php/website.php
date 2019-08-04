<?php
require_once(realpath(__DIR__ . '/../vendor/autoload.php'));

function get_title() {
    return utf8_encode(string_jazzify('this is a website'));
}
