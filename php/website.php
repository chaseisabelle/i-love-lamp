<?php
require_once(realpath(__DIR__ . '/../vendor/autoload.php'));

const DB_HOST = 'mysql'; //<< container name
const DB_PORT = 3306;
const DB_USER = 'root';
const DB_PASS = 'root';

function db_open() {
    return pdo_open('mysql', DB_HOST, DB_PORT, DB_USER, DB_PASS);
}

function db_now($db) {
    return pdo_cell($db, 'SELECT NOW()', [], '?');
}

function get_title() {
    return 'the current mysql time is ' . db_now(db_open());
}
