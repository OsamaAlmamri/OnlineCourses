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
            $this->model('PermissionRole');
        $p = $this->model->getPermissionByName($name);
//        return (in_array($p, $_SESSION['user_permissions']));
        return (in_array($p, $this->getPermission()));
    }

    public
    function allow($name)
    {
        if ($this->hasPermision($name))
            return true;
        \Helper::back('/home', '', '');
    }


    public function getPermission()
    {
//        if ($this->model == 'Usres')
//            $per = $this->model;
//        else
//        $per = new \Users();
        $per = $this->model->getPermissions($_SESSION['role_id']);

        $permissions = [];
        foreach ($per as $p) {
            $permissions[] = $p['permission_id'];
        }
        return $permissions;
    }


}