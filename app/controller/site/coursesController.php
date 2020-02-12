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
        $course_site = $this->model('Course_site');
        $user_id = Session::get('user')['user_id'];
        $userWishList = $course_site->wishListUser($user_id);
        $userWishList = (explode(',', $userWishList[0]['user_wish_list']));
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses',
            ['courses' => $course_site->all(),
                'userWishList' => $userWishList,
                'deleted' => false,
            ]);
        $this->view->pageTitle = 'Course_site';
        $this->view->render();

    }


    public function insertCourseUser()
    {

        $userCourse = $this->model('Course_site');
        $user_id = Session::get('user')['user_id'];
        $userWishList = $userCourse->wishListUser($user_id);

        $userWishList = explode(',', $userWishList[0]['user_wish_list']);



        if ($_REQUEST['wishListstatus'] == 0) {
            if (($key = array_search($_REQUEST['data_id_wishList'], $userWishList)) !== false) {
                unset($userWishList[$key]);
            }


        } else {
            $userWishList[] = $_REQUEST['data_id_wishList'];
            if(count($userWishList)>0) {
                $userWishList = implode(',', $userWishList);
           
            }
            else
                $userWishList='';

        }

        var_dump($userWishList) ;


        $userCourse->updateFromthewishlist(array(
            ":user_wish_list" => $userWishList,
            ":user_id" => $user_id
        ));




    }

}

?>