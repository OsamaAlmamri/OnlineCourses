<?php

class Hashing
{
    const SALT_TEXT = 'password slat1!@!@#$%^';

    private $password;
    private $hashedPassword;
    private $salt;
    private static $instance;

    function __construct($password, $saltText = null)
    {
        $this->password = $password;
        $this->salt = md5(is_null($saltText) ? self::SALT_TEXT : $saltText);
        $this->hashedPassword = md5($this->salt . $password);
    }


    public function __toString()
    {
        return $this->hashedPassword;
    }

    // init instance of this class to allow access for all function like static function
    public static function init($password, $saltText = [])
    {
        if (is_null(self::$instance)) {
            self::$instance = new self($password);
        }
        return self::$instance;
    }
}
