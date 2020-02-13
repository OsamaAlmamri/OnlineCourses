<?php

namespace site;

use Controller;
use Session;

class wishListController extends Controller
{

    public function index()
    {


        $course_site = $this->model('Course_site');
        $user_id = Session::get('user')['user_id'];
        $WishList = $course_site->wishListUser($user_id)[0]['user_wish_list'];
        $courses = $course_site->wishListElements('(' . trim($WishList, ",") . ')');
        if (($WishList) != '') {
            $userWishList = (explode(',', $WishList));
        } else
            $userWishList = [];
        $this->view('website' . DIRECTORY_SEPARATOR . 'wish_list',
            ['courses' => $courses,
                'userWishList' => $userWishList,
                'deleted' => false,
            ]);
        $this->view->pageTitle = 'قائمة مفضلاتي';
        $this->view->render();

    }
}

?>