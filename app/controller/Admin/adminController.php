<?php

/**
 *
 */
namespace admin;

use auth\Login;
use auth\LogOut;
use auth\Register;
use Controller;
use Helper;

class adminController extends Controller
{


    public function index()
    {
        Helper::viewAdminFile();
        $this->model('Course');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'index', ['news' => $this->model->all()]);
        $this->view->pageTitle = 'admin index';
        $this->view->render();

    }


    public function login()
    {
        $auth = new Login;
        $auth->login('admin');

    }

    public function register()
    {
        $auth = new Register;
        $auth->register('admin');
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
