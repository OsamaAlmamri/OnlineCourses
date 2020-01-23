<?php

/**
 *
 */
namespace site;

use auth\Activation;
use auth\login;
use auth\LogOut;
use auth\Register;
use Controller;

class homeController extends Controller
{


    public function index($id = '', $name = '')
    {
        $news = $this->model('Course');
        $category = $this->model('Category');
        $this->view('home' . DIRECTORY_SEPARATOR . 'index', ['news' => [], 'category' => []]);
//        $this->view('home' . DIRECTORY_SEPARATOR . 'index', ['news' => $news->all(), 'category' => $category->all()]);
        $this->view->pageTitle = 'home';
        $this->view->render();
    }

    public function login()
    {
        $auth = new Login;
        $auth->login('student');
    }

//    public function register()
//    {
//
//        $this->view('home' . DIRECTORY_SEPARATOR . 'register');
//        $this->view->pageTitle = 'register';
//        $this->view->render();
//    }

    public function register()
    {
        $auth = new Register;
        $auth->register('student');
    }

    public function activation()
    {
        $activeUser = new Activation($_GET);
        $activeUser->activeUser();
    }


    public function signUp()
    {
        $auth = new Register;
        $auth->register('student');
    }


    public function logout()
    {
        $auth = new LogOut;
        $auth->logout();
    }

    public function PostLogin()
    {
        $auth = new login;
        $auth->PostLogin();
    }

}

?>
