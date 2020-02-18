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

    public function getCourse($id)
    {
        $course_site = $this->model('Course_site');
        $user_id = Session::get('user')['user_id'];
        $userWishList = $course_site->wishListUser($user_id);

        if ($userWishList)
        $userWishList = (explode(',', $userWishList[0]['user_wish_list']));
        else
            $userWishList=[];
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses',
            [
                'courses' => $course_site->getCoursesById($id),
                'category_id' => $id,
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
        if ($userCourse->userHasCourses($user_id) == false) {
            $userCourse->insertInToUsersCourses(array(
                ":user_wish_list" => '',
                ":user_id" => $user_id
            ));
        }
        $userWishList = $userCourse->wishListUser($user_id);
        $userWishList = explode(',', $userWishList[0]['user_wish_list']);
        if ($_REQUEST['status'] == 1) {
            if (($key = array_search($_REQUEST['id'], $userWishList)) !== false)
                unset($userWishList[$key]);
        } else
            $userWishList[] = $_REQUEST['id'];

        if (count($userWishList) > 0) {
            $userWishList = implode(',', $userWishList);
        } else
            $userWishList = '';
        $userCourse->updateFromthewishlist(array(
            ":user_wish_list" => $userWishList,
            ":user_id" => $user_id
        ));
        echo $_REQUEST['id'];


    }

//public function addCoursesId(){
//    Session::set('cousresUserId'=>);
//}

}

?>