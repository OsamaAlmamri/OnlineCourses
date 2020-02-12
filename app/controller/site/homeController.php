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

class homeController extends Controller
{


    public function index($id = '', $name = '')
    {
        $news = $this->model('Course');
        $category = $this->model('Category');
        $course_site = $this->model('Course_site');
        $this->view('website' . DIRECTORY_SEPARATOR . 'home', ['news' => [], 'latestCourses' => $course_site->latestCoursesWebsite()]);

//        $this->view('home' . DIRECTORY_SEPARATOR . 'index', ['news' => $news->all(), 'category' => $category->all()]);
        $this->view->pageTitle = 'home';
        $this->view->render();
    }

    public function contact()
    {
        $this->view('website' . DIRECTORY_SEPARATOR . 'contact', ['news' => [], 'category' => []]);
        $this->view->pageTitle = 'contact';
        $this->view->render();
    }


    public function cart1()
    {
        $course = $this->model('Course');
        $courses = [];
        if (isset($_COOKIE['cartElements'])) {
            $cartElements = Helper::CookieElenments($_COOKIE['cartElements']);
            $courses = $course->cartElements($cartElements);
        }
        $this->view('website' . DIRECTORY_SEPARATOR . 'cart1', ['cartElements' => $courses, 'category' => []]);
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

    public function countDuration($data)
    {
        $sum = 0;

        foreach ($data as $lesson) {
            $file = Helper::getVideoDeatils(substr($lesson['resources_video'], 1));
            $sum += $file['playtime_seconds'];
        }
        return $sum;


    }

    public function course_detail($id)
    {
        $courseModel = $this->model('Course');
        $course = $courseModel->find($id);
        $lessons = $this->model('Lesson');
        $duration = 0;
        $chaptersLessons = [];
        $course_count = $lessons->cont_lessons($id);
        foreach ($lessons->chapterNames($id) as $chapter) {
            $le = $lessons->chapterLessons($id, $chapter['resources_chapter']);
            $courseDuration = $this->countDuration($le);
            $duration += $courseDuration;
            $chaptersLessons[$chapter['resources_chapter']] = array(
                'duration' => gmdate("H:i:s", $courseDuration),
                'lessons' => $le,
            );
        }


        //get all Ratings of course
        $RatingModel = $this->model('Rating');
        $AllRatings = $RatingModel->allRatingsOfCourse($id);


        $this->view('website' . DIRECTORY_SEPARATOR . 'course_detail',
            [
                'course' => $course,
                'lessons' => $chaptersLessons,
                'course_count' => $course_count,



                'course_duration' => gmdate("H:i:s", $courseDuration),
                'AllRatings'=>$AllRatings,

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
