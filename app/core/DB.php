<?php

// static class for database using singletone pattern
class DB
{
    private static $instance;

    public const DB_USER = 'root';
    private const DB_PASS = '';
    private $dsn = "mysql:host=localhost;dbname=e-learning";
    private static $PDO_OBJECT;


    public function __construct()
    {
        try {
            $this->dsn = "mysql:host=localhost;dbname=e-learning";
            self::$PDO_OBJECT = new PDO($this->dsn, DB::DB_USER, DB::DB_PASS);

            self::$PDO_OBJECT->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo 'Connection failed: ' . $e->getMessage();
        }


        self::$PDO_OBJECT->exec("SET NAMES utf8");

        if (!self::$PDO_OBJECT) {
            throw new Exception('Could not connect to DB ');
        }
    }

// init instance of this class to allow access for all function like static function
    public static function init()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;
    }


    public function query($sql)
    {
        if (!self::$PDO_OBJECT) {

            return false;
        }

        $result = self::$PDO_OBJECT->query($sql);

        $data = array();
        while ($row = $result->fetch()) {
            $data[] = $row;
        }


        return $data;
    }


    public function escape($str)
    {
        return self::$PDO_OBJECT->quote($str);
    }

    public function preparation($str)
    {
        $stmt = self::$PDO_OBJECT->prepare($str);
        return $stmt;
    }
}
