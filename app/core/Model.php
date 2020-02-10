<?php

class Model
{
    protected $pdoObject;
    protected $dsn;

    const DB_USER = 'root';
    const DB_PASS = '';


    public function __construct()
    {
        try {
            $this->dsn = "mysql:host=localhost;dbname=e-learning";
            $this->pdoObject = new PDO($this->dsn, Model::DB_USER, Model::DB_PASS);
            $this->pdoObject->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo 'Connection failed: ' . $e->getMessage();
        }

        $this->pdoObject->exec("SET NAMES utf8");

        if (!$this->pdoObject) {
            throw new Exception('Could not connect to DB ');
        }
    }

    public function query($sql)
    {
        if (!$this->pdoObject) {

            return false;
        }

        $result = $this->pdoObject->query($sql);

        $data = array();
        while ($row = $result->fetch()) {
            $data[] = $row;
        }


        return $data;
    }

    public function fetchOne($sql)
    {
        if (!$this->pdoObject) {

            return false;
        }

        $result = $this->pdoObject->query($sql);
        $row = $result->fetch();
        return $row;
    }

    public function escape($str)
    {
        return $this->pdoObject->quote($str);
    }

    public function preparation($str)
    {
        $stmt = $this->pdoObject->prepare($str);
        return $stmt;
    }

    public function lastInsertId()
    {
        $stmt = $this->pdoObject->lastInsertId();

        return $stmt;

    }

}
