<?php


namespace site;
use auth\Activation;
use auth\login;
use auth\LogOut;
use auth\Register;
use Session;
use Controller;

/* ** */
class coursesController extends \Controller
{


    public function index()
    {
        $course_site=$this->model('Course_site');
//        return var_dump( $course_site->all() );
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses', ['courses' => $course_site->all() ,'deleted' => false]);
        $this->view->pageTitle ='Course_site';
        $this->view->render();
}
public function insertCourseUser(){
   $userCourse=$this->model('Course_site');
    $userInfoCourse=array(
        ":user_id"=>Session::get('user')['user_id'],
        ":course_buy"=>explode($_COOKIE['item_id'])

    );
}
//public function addCoursesId(){
//    Session::set('cousresUserId'=>);
//}
}
?>