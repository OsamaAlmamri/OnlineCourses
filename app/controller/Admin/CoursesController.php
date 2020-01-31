<?php

/**
 *
 */
namespace Admin;

use Controller;
use Helper;

class CoursesController extends Controller
{


    public function index()
    {
        Helper::viewAdminFile();

        $course = $this->model('Course');
//        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'index', ['courses' => $course->all(), 'deleted' => false]);
        $this->view->pageTitle = 'courses';
        $this->view->render();
    }

    public function addVideo()
    {
        Helper::viewAdminFile();

//        $category = $this->model('Category');
//        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'addVideo', ['courses' => [], 'deleted' => false]);
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

    public function saveVideo($size = '')
    {

        $ini_PostSize = preg_replace("/[^0-9,.]/", "", ini_get('post_max_size')) * (1024 * 1024);
        $ini_FileSize = preg_replace("/[^0-9,.]/", "", ini_get('upload_max_filesize')) * (1024 * 1024);
        $maxFileSize = ($ini_PostSize < $ini_FileSize ? $ini_PostSize : $ini_FileSize);
        $file = (isset($_FILES["file1"]) ? $_FILES["file1"] : 0);

        if (($size != '')) {
            echo $maxFileSize;
            exit;
        }
        if (!$file) { // if file not chosen

            if ($file["size"] > $maxFileSize) {
                die("ERROR: The File is too big! The maximum file size is " . $maxFileSize / (1024 * 1024) . "MB");
            }
            die("ERROR: Please browse for a file before clicking the upload button");
        }
        if ($file["error"]) {

            die("ERROR: File couldn't be processed");

        }
        $time = time();
        if (move_uploaded_file($file["tmp_name"], "videos/" . $time . $file["name"])) {
//    echo "SUCCESS: The upload of " . $file["name"] . " is complete";
            echo '/videos/' . time() . $file["name"];

        } else {
            echo "ERROR: Couldn't move the file to the final location";
        }

    }

    public function create()
    {
        Helper::viewAdminFile();
        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['categories']);
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
            ]);
            if (count($validate) == 0) {
                if (isset($_FILES['courses_image']['name']))
                    $image = Helper::saveImage('courses_image', 'images/courses/');
                $course = array(
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
