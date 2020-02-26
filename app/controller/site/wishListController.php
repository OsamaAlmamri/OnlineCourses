<?php

namespace site;

use Controller;
use Helper;
use Session;

class wishListController extends Controller
{

    public function index()
    {


        $course_site = $this->model('Course_site');
        $user_id = Session::get('user')['user_id'];
        $WishList = $course_site->wishListUser($user_id)[0]['user_wish_list'];
        $whereIn=($WishList!='')? '(' . trim($WishList, ",") . ')':'(0)';
        $courses = $course_site->wishListElements($whereIn);
        if (($WishList) != '') {
            $userWishList = (explode(',', $WishList));
        } else
            $userWishList = [];
        $lastCourses = [];
        $this->model('Lesson');
        foreach ($courses as $course) {
            $lastCourses[] = array_merge($course, $this->course_info($course['course_id']));
        }
//        $this->view('website' . DIRECTORY_SEPARATOR . 'index', [
//            'courses' => $lastCourses,
//            'userWishList' => $userWishList,
//
//        ]);
        $this->view('website' . DIRECTORY_SEPARATOR . 'wish_list',
            ['courses' => $lastCourses,
                'userWishList' => $userWishList,
                'deleted' => false,
            ]);
        $this->view->pageTitle = 'قائمة مفضلاتي';
        $this->view->render();

    }
    public function course_info($id)
    {
//        $lessons = $this->model=null;
        $lessons = $this->model;
        $courseDuration = 0;
        $chaptersLessons = [];
        $course_count = $lessons->count_lessons($id);
        $chaptersName = $lessons->chapterNames($id);
        foreach ($chaptersName as $chapter) {
            $videos = $lessons->chapterLessons($id, $chapter['resources_chapter']);
            $chapterDuration = $this->countDurationChapter($videos);
            $courseDuration += $chapterDuration;
            $chaptersLessons[$chapter['resources_chapter']] = array(
                'duration' => gmdate("H:i:s", $chapterDuration),
                'lessons' => $videos,
            );
        }
        $averageRating = $this->model->averageRating($id);
        $info = array(
            'duration' => gmdate("H:i:s", $courseDuration),
            'course_count' => $course_count,
            'averageRating' => isset($averageRating[0]['average_rating']) ? $averageRating[0]['average_rating'] : 0,
            'AllRatings' => isset($averageRating[0]['total_rating']) ? $averageRating[0]['total_rating'] : 0,
        );
        return $info;
    }
    public function countDurationChapter($data)
    {
        $sum = 0;

        foreach ($data as $lesson) {


            $file = Helper::getVideoDeatils(substr($lesson['resources_video'], 1));
            $sum += $file['playtime_seconds'];
        }
        return $sum;


    }

}

?>