<?php


namespace site;

use Session;

/* ** */

class coursesController extends \Controller
{


    public function old()
    {


        //return var_dump($_COOKIE['item_id']);
    }

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
//        var_dump('sta =>' . $_REQUEST['status']);
//        var_dump('id =>' . $_REQUEST['id']);
        if ($_REQUEST['status'] == 1) {
            if (($key = array_search($_REQUEST['id'], $userWishList)) !== false)
                unset($userWishList[$key]);
        } else
            $userWishList[] = $_REQUEST['id'];

        if (count($userWishList) > 0) {
            $userWishList = implode(',', $userWishList);
        } else
            $userWishList = '';
        var_dump($userWishList);
        $userCourse->updateFromthewishlist(array(
            ":user_wish_list" => $userWishList,
            ":user_id" => $user_id
        ));
        echo '1';


    }

//public function addCoursesId(){
//    Session::set('cousresUserId'=>);
//}

}

?>