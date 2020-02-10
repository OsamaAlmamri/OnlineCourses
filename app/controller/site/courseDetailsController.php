<?php


namespace site;

use auth\Activation;
use auth\login;
use auth\LogOut;
use auth\Register;
use Session;
use Controller;

/* ** */

class courseDetailsController extends \Controller
{


    public function index()
    {
        $course_site = $this->model('Course_site');
//        return var_dump( $course_site->all() );
        $this->view('website' . DIRECTORY_SEPARATOR . 'course_detail', ['course_detail' => $course_site->all(), 'deleted' => false]);

        $this->view->pageTitle = 'Course_site';
        $this->view->render();
    }
}


?>
