<?php


namespace site;

use Helper;
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
            $userWishList = [];
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

    public function course_detail($id, $from = '')
    {
        //get all details for course
        if ($from == 'fromSubscribe')
            $course_site = $this->model;
        else
            $course_site = $this->model('Course_site');
        $userSubscribe = $this->userSubscribeInCourse($id);

        $user_id = (isset($_SESSION['user'])) ? Session::get('user')['user_id'] : 0;
        $userWishList = $course_site->wishListUser($user_id);
//        return var_dump($userWishList);
        if (count($userWishList) > 0) {
            $userWishList = (explode(',', $userWishList[0]['user_wish_list']));

        } else
            $userWishList = [];

        $courseModel = $this->model('Course');
        $course = $courseModel->find($id);

        //access to videos table and get all details
        $lessons = $this->model('Lesson');
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

        //get all Ratings of course
        $RatingModel = $this->model('Rating');
        $AllRatings = $RatingModel->allRatingsOfCourse($id);
        $averageRating = $RatingModel->averageRating($id);
        $checkIfUserHasRated = $RatingModel->checkIfUserHasrated($user_id, $id);


//        return var_dump($userSubscribe);
        $this->view('website' . DIRECTORY_SEPARATOR . 'CourseDetails',
            [
                'course' => $course,
                'lessons' => $chaptersLessons,
                'userSubScribe' => $userSubscribe,
                'course_count' => $course_count,
                'userWishList' => $userWishList,
                'course_duration' => gmdate("H:i:s", $courseDuration),
                'AllRatings' => $AllRatings,
                'averageRating' => $averageRating,
                'checkIfUserHasRated' => $checkIfUserHasRated,
                'percentageRating' => $this->getPercentageForEachRating_For_SpecificCourse($id),

            ]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
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

    public function course_review($id)
    {
        //get all details for course
        $course_site = $this->model('Course_site');
        $userSubscribe = $this->userSubscribeInCourse($id);
        $user_id = (isset($_SESSION['user'])) ? Session::get('user')['user_id'] : 0;
        $userWishList = $course_site->wishListUser($user_id);
//        return var_dump($userWishList);
        if (count($userWishList) > 0) {
            $userWishList = (explode(',', $userWishList[0]['user_wish_list']));

        } else
            $userWishList = [];

        $courseModel = $this->model('Course');
        $course = $courseModel->find($id);

        //access to videos table and get all details
        $lessons = $this->model('Lesson');
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

        //get all Ratings of course
        $RatingModel = $this->model('Rating');
        $AllRatings = $RatingModel->allRatingsOfCourse($id);
        $averageRating = $RatingModel->averageRating($id);
        $checkIfUserHasRated = $RatingModel->checkIfUserHasrated($user_id, $id);

        $this->view('website' . DIRECTORY_SEPARATOR . 'CourseReview',
            [
                'course' => $course,
                'lessons' => $chaptersLessons,
                'userSubScribe' => $userSubscribe,

                'course_count' => $course_count,
                'userWishList' => $userWishList,
                'course_duration' => gmdate("H:i:s", $courseDuration),
                'AllRatings' => $AllRatings,
                'averageRating' => $averageRating,
                'checkIfUserHasRated' => $checkIfUserHasRated,
                'percentageRating' => $this->getPercentageForEachRating_For_SpecificCourse($id),

            ]);
        $this->view->pageTitle = 'course ';
        $this->view->render();
    }


    public function getPercentageForEachRating_For_SpecificCourse($id)
    {
        //get all Ratings of course
        $percentage = [];
        $RatingModel = $this->model;
        $total_rating = isset($RatingModel->averageRating($id)[0]['total_rating']) ? $RatingModel->averageRating($id)[0]['total_rating'] : 0;

        $total_for_each_rating = $RatingModel->getTotalForEachRating_For_SpecificCourse($id);
        foreach ($total_for_each_rating as $Rating) {
            $precentage = explode('.', ($Rating['total_for_each_rating'] / $total_rating) * 100);
            $percentage[$Rating['rating_number']] = $precentage[0];

        }

        return $percentage;

    }

    public function subscribe($id)
    {
//        return var_dump($id);
        $userCourse = $this->model('Course_site');
        $user_id = Session::get('user')['user_id'];
        if ($userCourse->userHasCourses($user_id) == false) {
            $userCourse->insertInToUsersBuyCourses(array(
                ":couces_buy" => '',
                ":user_id" => $user_id
            ));
        }
        $userWishList = $userCourse->wishListUser($user_id);
        $userWishList = explode(',', $userWishList[0]['couces_buy']);
        if ($this->userSubscribeInCourse($id) == false) {
            $userWishList[] = $id;
            if (count($userWishList) > 0) {
                $userWishList = implode(',', $userWishList);
            } else
                $userWishList = '';
            $userCourse->updateUserCourse(array(
                ":couces_buy" => $userWishList,
                ":user_id" => $user_id
            ));

        }
        $this->course_detail($id, 'fromSubscribe');


//        return var_dump($id);
//        echo $_REQUEST['id'];


    }

    public function userSubscribeInCourse($id)
    {
        $userCourse = $this->model;
        if (isset($_SESSION['user']['user_id']))
            $user_id = $_SESSION['user']['user_id'];
        else
        return false;
        
        $userWishList = $userCourse->wishListUser($user_id);
        $userWishList = explode(',', $userWishList[0]['couces_buy']);
        if (($key = array_search($id, $userWishList)) !== false)
            return true;
        else
            return false;
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

    public function course_rating_info($id)
    {
        $RatingModel = $this->model('Rating');
        $averageRating = $RatingModel->averageRating($id);
        $info = array(
            'averageRating' => $averageRating[0]['average_rating'],
            'AllRatings' => $averageRating[0]['total_rating'],
        );
        return $info;
    }


//public function addCoursesId(){
//    Session::set('cousresUserId'=>);
//}

}

?>