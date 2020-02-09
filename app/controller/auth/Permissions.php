<?php

namespace auth;

use Controller;

class Permissions extends Controller
{
    private static $instance = null;

    public static function getInstaince()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }
        return self::$instance;

    }

    public function __construct()
    {
//        if (self::$opbject == null)
//            self::$opbject = new Permissions();
//
//        return self::$opbject;

    }

    public
    function hasPermision($name)
    {
        if ($this->model == null)
            $this->model('Permision');
        $p = $this->model->getPermissionByName($name);
        return (in_array($p, $_SESSION['user_permissions']));
    }

    public
    function allow($name)
    {
        if ($this->hasPermision($name))
            return true;
        \Helper::back('/home', '', '');
    }


}