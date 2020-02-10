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


    public function old()
    {


        //return var_dump($_COOKIE['item_id']);
    }

    public function index()
    {
        $course_site=$this->model('Course_site');
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses', ['courses' => $course_site->all() ,'deleted' => false]);
        $this->view->pageTitle ='Course_site';
        $this->view->render();
}

public function insertCourseUser(){

   $userCourse=$this->model('Course_site');
    $userInfoCourse=array(
        ":user_id" =>Session::get('user')['user_id'],
//   ":couces_buy"=>implode(",",$_COOKIE['item_id']),
        ":user_wish_list"=>implode(",",$_COOKIE['item_whishlish_id'])
    );
   $userCourse->insertInToUsersCourses($userInfoCourse);
echo 1;
   // Helper::back('/cousres' , 'add successfully', 'success');

    }

//public function addCoursesId(){
//    Session::set('cousresUserId'=>);
//}

}
?>
