<?php

namespace site;

use Controller;
use Session;

class wishListController extends Controller
{

    public function index()
    {
        $courses = [];
        $userWishList = $this->UserWishList(Session::get('user')['user_id']);
        if (count($userWishList) > 0)
            $courses = $this->model->wishListElements('(' . trim(implode($userWishList), ",") . ')');
        $this->view('website' . DIRECTORY_SEPARATOR . 'wish_list',
            ['courses' => $courses,
                'userWishList' => $userWishList,
                'deleted' => false,
            ]);
        $this->view->pageTitle = 'قائمة مفضلاتي';
        $this->view->render();

    }

    public function UserWishList($user_id)
    {

        $course_site = $this->model('Course_site');
        $WishList = $course_site->wishListUser($user_id)[0]['user_wish_list'];
        $userWishList = [];
        if (($WishList) != '')
            $userWishList = (explode(',', $WishList));
        return $userWishList;
    }
}

?>