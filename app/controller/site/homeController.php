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
        $this->view('website' . DIRECTORY_SEPARATOR . 'home', ['news' => [], 'category' => []]);

//        $this->view('home' . DIRECTORY_SEPARATOR . 'index', ['news' => $news->all(), 'category' => $category->all()]);
        $this->view->pageTitle = 'home';
        $this->view->render();
    }

    public function contact()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'contact', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'contact';
        $this->view->render();
    }

    public function cart1()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart1', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'cart1';
        $this->view->render();
    }

    public function cart2()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart2', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'cart2';
        $this->view->render();
    }

    public function cart3()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart3', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'cart3';
        $this->view->render();
    }

    public function courses_list()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses_list', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }

    public function course_detail()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'course_detail', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }

    public function courses()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }

    public function courses_list_sidebar()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses_list_sidebar', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }

    public function home()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'home', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
        $this->view->render();
    }

    public function mycourses()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'mycourses', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
        $this->view->render();
    }
    public function profile()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'profile', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
        $this->view->render();
    }
    public function wish_list()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'wish_list', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
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

    public function register($type)
    {
        $auth = new Register;
        $auth->register($type);
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
