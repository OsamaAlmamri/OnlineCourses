<?php


namespace auth;

use Controller;
use site\homeController;

class Permissions extends Controller
{
    public function __construct()
    {

    }


    public function hasPermision($name)
    {
        $this->model('Permision');
        $p = $this->model->getPermissionByName($name);
        return (in_array($p, $_SESSION['user_permissions']));
    }

    public function allow($name)
    {
        if ($this->hasPermision($name))
            return true;
        $h = new homeController;
        $h->index();
    }


}