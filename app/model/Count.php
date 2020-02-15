<?php


class Count
{
    protected $db;

    function __construct()
    {
        $this->db = new Model();
    }

    public function countItems($item ,$table)
    {
        return $this->db->query("SELECT COUNT($item) FROM $table");
    }

}