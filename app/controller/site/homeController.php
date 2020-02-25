<?php

/**
 *
 */
namespace site;

use auth\Activation;
use auth\login;
use auth\LogOut;
use auth\Register;
use Controller;
use Helper;
use Session;

class homeController extends Controller
{
    public function test($id = 5)
    {
        //get all details for course
        $course_site = $this->model('Course_site');
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
        $checkIfUserHasRated = $RatingModel->checkIfUserHasrated($user_id,$id);



        $this->view('website' . DIRECTORY_SEPARATOR . 'CourseDetails',
            [
                'course' => $course,
                'lessons' => $chaptersLessons,
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
    public function te($id = 5)
    {
        //get all details for course
        $course_site = $this->model('Course_site');
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
        $checkIfUserHasRated = $RatingModel->checkIfUserHasrated($user_id,$id);


        $this->view('website' . DIRECTORY_SEPARATOR . 'CourseReview',
            [
                'course' => $course,
                'lessons' => $chaptersLessons,
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



    public function index($id = '', $name = '')
    {
        $course_site = $this->model('Course_site');
        $user_id = (isset($_SESSION['user'])) ? Session::get('user')['user_id'] : 0;
        $userWishList = $course_site->wishListUser($user_id);
        if (count($userWishList) > 0) {
            $userWishList = (explode(',', $userWishList[0]['user_wish_list']));
        } else
            $userWishList = [];
        $lastCourses = [];
        $this->model('Lesson');
        foreach ($course_site->latestCoursesWebsite() as $course) {
            $lastCourses[] = array_merge($course, $this->course_info($course['course_id']));
        }
        $this->view('website' . DIRECTORY_SEPARATOR . 'index', [
            'news' => [],
            'courses' => $lastCourses,
            'userWishList' => $userWishList,

        ]);
        $this->view->pageTitle = 'الصفحة الرئيسية';
        $this->view->render();
    }

    public function contact()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'contact', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'تواصل معنا';
        $this->view->render();
    }
 public function aboutUs()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'aboutUs');
        $this->view->pageTitle = 'من نحن';
        $this->view->render();
    }


    public function cart1()
    {
        $course = $this->model('Course');
        $courses = [];
        if (isset($_COOKIE['cartElements'])) {
            $cartElements = Helper::prepareInMethodElement($_COOKIE['cartElements']);
            $courses = $course->cartElements($cartElements);
        }
        $total = 0;
        if (count($courses) > 0) {
            foreach ($courses as $s)
                $total += $s['course_price'];
        }
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart1', [
            'cartElements' => $courses,
            'total' => $total,
            'category' => []]);
        $this->view->pageTitle = 'cart1';
        $this->view->render();
    }

    public function cart2()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart2', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'cart2';
        $this->view->render();
    }

    public function cart3()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart3', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'cart3';
        $this->view->render();
    }

    public function courses_list()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses_list', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }


//        return print_r($lessons->allLessonByChapterName($id));

    public function countDurationChapter($data)
    {
        $sum = 0;

        foreach ($data as $lesson) {


            $file = Helper::getVideoDeatils(substr($lesson['resources_video'], 1));
            $sum += $file['playtime_seconds'];
        }
        return $sum;


    }

    public function getPercentageForEachRating_For_SpecificCourse($id)
    {
        //get all Ratings of course
        $percentage = [];
        $RatingModel = $this->model;
        $total_rating = isset($RatingModel->averageRating($id)[0]['total_rating']) ? $RatingModel->averageRating($id)[0]['total_rating'] : 0;

        $total_for_each_rating = $RatingModel->getTotalForEachRating_For_SpecificCourse($id);
        foreach ($total_for_each_rating as $Rating) {
            $percentage[$Rating['rating_number']] = ($Rating['total_for_each_rating'] / $total_rating) * 100;

        }

        return $percentage;

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
            'averageRating' => isset($averageRating[0]['average_rating'])?$averageRating[0]['average_rating']:0,
            'AllRatings' =>isset($averageRating[0]['total_rating'])? $averageRating[0]['total_rating']:0,
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

    public function course_detail($id)
    {
        //get all details for course
        $course_site = $this->model('Course_site');
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
        $checkIfUserHasRated = $RatingModel->checkIfUserHasRated($user_id, $id);


        $this->view('website' . DIRECTORY_SEPARATOR . 'course_detail',
            [
                'course' => $course,
                'lessons' => $chaptersLessons,
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

    public function courses()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }


    public function courses_list_sidebar()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'courses_list_sidebar', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'course list';
        $this->view->render();
    }


    public function mycourses()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'mycourses', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
        $this->view->render();
    }

    public function fectchLatestCourses()
    {
        $course_site = $this->model('Course_site');

        $this->view('website' . DIRECTORY_SEPARATOR . 'home', ['homeCourses' => $course_site->latestCoursesWebsite(), 'deleted' => false]);
        $this->view->pageTitle = 'Home';
        $this->view->render();
    }

    public function profile()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'profile', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
        $this->view->render();
    }

    public function wish_list()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'wish_list', ['news' => [], 'category' => []]);
        $this->view->pageTitle = ' home ';
        $this->view->render();
    }

    public function login()
    {
        $auth = new Login;
        $auth->login('student');
    }


    public function register($type)
    {
        $auth = new Register;
        $auth->register($type);
    }

    public function activation()
    {
        $activeUser = new Activation($_GET);
        $activeUser->activeUser();
    }


    public function signUp()
    {
        $auth = new Register;
        $auth->register('student');
    }


    public function logout()
    {
        $auth = new LogOut;
        $auth->logout();
    }

    public function PostLogin()
    {
        $auth = new login;
        $auth->PostLogin();
    }

}

?>
