<?php


namespace auth;

use Controller;
use Session;
use site\homeController;

class LogOut extends Controller
{
    public function logout()
    {
        Session::destroy();
        \Helper::backToHome('لقد تم تسجيل الخروج بناجاح  لا تطول علينا كثير ','success');
    }


}