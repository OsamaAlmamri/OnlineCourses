<?php

/**
 *
 */
namespace Admin;

use auth\Permissions;
use Controller;
use Helper;

class CoursesController extends Controller
{


    public function index()
    {
        Permissions::getInstaince()->allow('course_index');

//        return var_dump($_SESSION['userID']);

        $courses = [];
        $course = $this->model('Course');
        if ($_SESSION['role_name'] == 'university')
            $courses = $course->all($_SESSION['userID'], 'university');
        elseif ($_SESSION['role_name'] == 'teacher')
            $courses = $course->all($_SESSION['userID'], 'teacher');
        else
            $courses = $course->all();

        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'index', ['courses' => $courses, 'deleted' => false]);
        $this->view->pageTitle = 'courses';
        $this->view->render();
    }

    public function showLessons()
    {
        Permissions::getInstaince()->allow('course_showLesson');

        $course = $this->model('Course');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'lessons' . DIRECTORY_SEPARATOR . 'index', ['courses' => $course->all(), 'deleted' => false]);
        $this->view->pageTitle = 'courses';
        $this->view->render();
    }


    public function active()
    {

        $data = array(
            ':course_id' => htmlentities($_REQUEST['data_id']),
            ':course_status' => htmlentities(($_REQUEST['status'] == 1) ? 0 : 1),
        );
        $course = $this->model('Course');
        $status = ($course->activeByAdmin($data));
        echo ($_REQUEST['status'] == 1) ? 0 : 1;
    }

    public function visibility()
    {
        $data = array(
            ':course_id' => htmlentities($_REQUEST['data_id']),
            ':course_visibility' => htmlentities(($_REQUEST['visibility'] == 1) ? 0 : 1),
        );
        $course = $this->model('Course');
        $status = ($course->visibility($data));
        echo ($_REQUEST['visibility'] == 1) ? 0 : 1;
    }

    public function create()
    {
        Permissions::getInstaince()->allow('course_create');

        Helper::viewAdminFile();
        $this->model('Role');
        $role_id = $this->model->getRoleByName('teacher');
        $teachers = $this->model('Users');
        if ($_SESSION['role_name'] == 'university')
            $Allteachers = $teachers->UniversityTeacher($role_id, Session::logged());
        else
            $Allteachers = $teachers->all($role_id);


        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['teachers' => $Allteachers]);
        $this->view->pageTitle = 'Courses';
        $this->view->render();
    }

    public function fetchParentCategory()
    {

        Helper::viewAdminFile();

        $this->model('Category');
        $data = $_REQUEST['filter_name'];

        $c = $this->model->mainCategories($data);
        $c = json_encode($c);
        echo($c);
    }
//course_id
//course_title
//course_description
//courses_image
//course_price
//course_requirements
//course_students_target
//course_goals
//categories_ids
//course_date
//course_status
//course_updates
//course_visibility

    public function store()
    {
        Permissions::getInstaince()->allow('course_store');


        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $validate = \Validation::validate([
                'course_title' => array(['required' => 'required']),
                'course_description' => array(['required' => 'required']),
                'courses_image' => array(['imageRequired' => 'imageRequired']),
                'course_price' => array(['required' => 'required']),
                'course_price_afterDiscount' => array(['required' => 'required']),
                'course_students_target' => array(['required' => 'required']),
                'course_goals' => array(['required' => 'required']),
                'categories_ids' => array(['hasElements' => 'hasElements']),
                'course_owner' => array(['hasElements' => 'hasElements']),
            ]);
            if (count($validate) == 0) {
                if (isset($_FILES['courses_image']['name']))
                    $image = Helper::saveImage('courses_image', 'images/courses/');
                $course = array(
                    ':course_owner' => htmlentities($_REQUEST['course_owner']),
                    ':course_title' => htmlentities($_REQUEST['course_title']),
                    ':course_description' => htmlentities($_REQUEST['course_description']),
                    ':courses_image' => $image,
                    ':course_price' => htmlentities($_REQUEST['course_price']),
                    ':course_price_afterDiscount' => htmlentities($_REQUEST['course_price_afterDiscount']),
                    ':course_students_target' => htmlentities($_REQUEST['course_students_target']),
                    ':course_goals' => htmlentities($_REQUEST['course_goals']),
                    ':categories_ids' => json_encode($_REQUEST['categories_ids']),
                );
                $this->model('Course');
                $id = $this->model->add($course);
                if ($id) {
                    Helper::back('/admin/courses/index', 'add successfully', 'success');
                    return;
                }
            } else {
                Helper::back('/admin/courses/create', 'error in required input', 'danger');
                return;
            }
        }


    }


}


?>
