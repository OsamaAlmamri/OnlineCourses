<?php

/**
 *
 */
namespace Admin;

use Controller;
use Helper;

class LessonsController extends Controller
{


    public function index($id)
    {
        Helper::viewAdminFile();

        $lessons = $this->model('Lesson');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'lessons' . DIRECTORY_SEPARATOR . 'index', ['courses' => $lessons->course_lessons($id), 'course_id' => $id, 'deleted' => false]);
        $this->view->pageTitle = 'courses';
        $this->view->render();
    }


    public function saveVideo($size = '')
    {
        ini_set('upload_max_filesize', '1000M');
        ini_set('post_max_size', '1000M');
        ini_set('max_input_time', 300);
        ini_set('max_execution_time', 300);

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
        $time = time() . '______';
        if (move_uploaded_file($file["tmp_name"], "videos/" . $time . $file["name"])) {
//    echo "SUCCESS: The upload of " . $file["name"] . " is complete";
            echo '/videos/' . time() . $file["name"];

        } else {
            echo "ERROR: Couldn't move the file to the final location";
        }

    }

    public function create($course_id)
    {
        Helper::viewAdminFile();

        $this->view('admin' . DIRECTORY_SEPARATOR . 'courses' . DIRECTORY_SEPARATOR . 'lessons' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['course_id' => $course_id]);
        $this->view->pageTitle = 'Course Lessons';
        $this->view->render();
    }

    public function fetchChapter()
    {

        Helper::viewAdminFile();

        $this->model('Lesson');
        $data = $_REQUEST['filter_name'];

        $c = $this->model->getChapters($data);
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

//        return var_dump($_REQUEST);

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $validate = \Validation::validate([
                'resources_chapter' => array(['required' => 'required']),
                'course_id' => array(['required' => 'required']),
                'resources_video' => array(['required' => 'required']),
            ]);
            if (count($validate) == 0) {

                $course = array(
                    ':resources_chapter' => htmlentities($_REQUEST['resources_chapter']),
                    ':course_id' => htmlentities($_REQUEST['course_id']),
                    ':resources_video' => htmlentities($_REQUEST['resources_video']),

                );
                $this->model('Lesson');
                $id = $this->model->add($course);

                if ($id) {
                    Helper::back('/admin/lessons/index/' . $_REQUEST['course_id'], 'add successfully', 'success');
                    return;
                }
            } else {
                Helper::back('/admin/lessons/create/' . $_REQUEST['course_id'], 'error in required input', 'danger');
                return;
            }
        }


    }


}


?>
