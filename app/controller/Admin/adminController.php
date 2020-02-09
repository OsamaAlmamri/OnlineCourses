<?php

/**
 *
 */
namespace admin;

use auth\Login;
use auth\LogOut;
use auth\Permissions;
use auth\Register;
use Controller;
use Helper;

class adminController extends Controller
{


    public function index()
    {
        Permissions::getInstaince()->allow('admin_index');
        $this->model('Course');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'index', ['news' => $this->model->all()]);
        $this->view->pageTitle = 'admin index';
        $this->view->render();

    }


    public function login()
    {
        if (!isset($_SESSION['user'])) {
            $auth = new Login;
            $auth->login('admin');
        } else {
//            header("Location: " . $_SERVER["HTTP_REFERER"]);
            Helper::back('/home', '', '');
        }

    }

    public function register()
    {
//        $auth = new Register;
//        $auth->register('admin');
        if (!isset($_SESSION['user'])) {
            $this->view('home' . DIRECTORY_SEPARATOR . 'login', ['active' => "singUP"]);
            $this->view->pageTitle = 'SingUp';
            $this->view->render();

        } else {
//            header("Location: " . $_SERVER["HTTP_REFERER"]);
            Helper::back('/home', '', '');
        }


    }

    public function PostLogin()
    {
        $auth = new login;
        $auth->login('admin');
    }


    public function logout()
    {
        $auth = new LogOut;
        $auth->logout();

    }

    public function singUp()
    {
        $auth = new Register($_REQUEST);
        $auth->signUp('student', 0);
    }

}


?>
