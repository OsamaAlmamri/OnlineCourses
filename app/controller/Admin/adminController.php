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

         $this->view('admin' . DIRECTORY_SEPARATOR . 'index', ['news' => $this->model->all(),"cousres"=>  $this->model->countItems("course_id","courses"),
             "users"=>  $this->model->countItems("user_id","users"),
             "categories"=>  $this->model->countItems("category_id","categories")]);
        $this->view->pageTitle = "لوحة التحكم";
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
            $this->view->pageTitle = 'تسجيل دخول';
            $this->view->render();

        } else {
//            header("Location: " . $_SERVER["HTTP_REFERER"]);
            Helper::back('/home', '', '');
        }


    }
    public function fetchCountTable()
    {

        $countTable = $this->model('Count');

        $countTableToView= $countTable->countItems("course_id","courses");

        $this->view('admin' . DIRECTORY_SEPARATOR . 'index', ['courses' => $this->model->all()]);
        $this->view->render();

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
