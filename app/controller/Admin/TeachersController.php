<?php

/**
 *
 */
namespace Admin;

use auth\Permissions;
use Controller;
use Helper;
use Message;
use Session;
use Validation;

class TeachersController extends Controller
{


    public function index()
    {
        $permissionObject=Permissions::getInstaince()->allow('teacher_index');


        $this->model('Role');
        $role_id = $this->model->getRoleByName('teacher');
        $teachers = $this->model('Users');
        if ($_SESSION['role_name'] == 'university')
            $Allteachers = $teachers->UniversityTeacher($role_id, Session::logged());
        else
            $Allteachers = $teachers->all($role_id);

//        return var_dump($Allteachers);

//        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'teachers' . DIRECTORY_SEPARATOR . 'index', ['teachers' => $Allteachers, 'deleted' => false]);
        $this->view->pageTitle = 'teachers';
        $this->view->render();
    }

    public function create()
    {

        $permissionObject=Permissions::getInstaince()->allow('teacher_create');

        $category = $this->model('Category');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'teachers' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['categories']);
        $this->view->pageTitle = 'Teacher';
        $this->view->render();
    }


    public function edit($id)
    {

        $permissionObject=Permissions::getInstaince()->allow('teacher_edit');

        $CatModel = $this->model('Category');
        $category = $CatModel->find($id)[0];
//        return var_dump($news);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'create', ['category' => $category, 'type' => 'update']);

//        $this->view('admin' . DIRECTORY_SEPARATOR . 'news' . DIRECTORY_SEPARATOR . 'create', ['news' => $news]);
        $this->view->pageTitle = 'الاصناف';
        $this->view->render();
    }

    public function delete($id)
    {
        $permissionObject=Permissions::getInstaince()->allow('teacher_delete');
        Helper::viewAdminFile();
        $this->model('Category');
        $c = $this->model->delete($id);


        if ($c == 'hasChild') {
            Message::setMessage('msgState', 0);
            Message::setMessage('main', ' لا زال هناك اقسام فرعية  تحت هذا القسم ');

        } else {

            Message::setMessage('msgState', 1);
            Message::setMessage('main', 'تم حذف القسم بنجاح');
        }

        $category = $this->model;
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view->pageTitle = 'الاصناف';
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


    public function store()
    {
        $permissionObject=Permissions::getInstaince()->allow('teacher_store');


        // check if there submit
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $validate = Validation::required(['', 'name_ar', 'name_en', 'section_count', 'newsCount', 'sort']);
            if ($validate['status'] == 1) {
                $cate = array(
                    ':name_ar' => htmlentities($_REQUEST['name_ar']),
                    ':name_en' => htmlentities($_REQUEST['name_en']),
                    ':parent' => htmlentities($_REQUEST['parent'] != null ? $_REQUEST['parent'] : 0),
                    ':section_count' => htmlentities($_REQUEST['section_count']),
                    ':newsCount' => htmlentities($_REQUEST['newsCount']),
                    ':isMain' => (isset($_REQUEST['isMain']) == 'on' ? 1 : 0),
                    ':liveNews' => (isset($_REQUEST['liveNews']) == 'on' ? 1 : 0),
                    ':hasSlides' => (isset($_REQUEST['hasSlides']) == 'on' ? 1 : 0),
                    ':sort' => htmlentities($_REQUEST['sort']),
                    ':status' => (isset($_REQUEST['status']) ? 1 : 0),
                    ':created_by' => Session::logged(),
                    ':updates' => '',
                    ':created_at' => time(),
                    ':updated_at' => time(),
                );

                if ($this->model == "Category")
                    $category = $this->model;
                else
                    $category = $this->model('Category');


                if ($category->add($cate)) {
                    Message::setMessage('msgState', 1);
                    Message::setMessage('main', 'تم اضافة القسم بنجاح');

                }
            }


        }

        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view->pageTitle = 'الاصناف';
        $this->view->render();
    }

    public function update()
    {

        $permissionObject=Permissions::getInstaince()->allow('teacher_update');

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $validate = Validation::required(['', 'name_ar', 'name_en', 'section_count', 'newsCount', 'sort']);
            if ($validate['status'] == 1) {
                $time = date("D- y/m/j  h-i-s ");
//

                $u = (['update_by' => Session::logged(), 'update_date' => $time]);
                $uArray = json_decode($_REQUEST['_updates']);
                $uArray[] = $u;

                $cate = array(
                    ':id' => htmlentities($_REQUEST['_id']),
                    ':name_ar' => htmlentities($_REQUEST['name_ar']),
                    ':name_en' => htmlentities($_REQUEST['name_en']),
                    ':parent' => htmlentities($_REQUEST['parent'] != null ? $_REQUEST['parent'] : 0),
                    ':section_count' => htmlentities($_REQUEST['section_count']),
                    ':newsCount' => htmlentities($_REQUEST['newsCount']),
                    ':isMain' => (isset($_REQUEST['isMain']) ? 1 : 0),
                    ':liveNews' => (isset($_REQUEST['liveNews']) ? 1 : 0),
                    ':hasSlides' => (isset($_REQUEST['hasSlides']) ? 1 : 0),
                    ':sort' => htmlentities($_REQUEST['sort']),
                    ':status' => (isset($_REQUEST['status']) ? 1 : 0), ':updates' => json_encode($uArray),
                    ':updated_at' => $time,
                );

                $this->model('Category');
                if ($this->model->update($cate)) {
                    Message::setMessage('msgState', 1);
                    Message::setMessage('main', 'تم تعديل القسم  بنجاح');
//                    $news = $this->model('Course');
                    $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $this->model->all(), 'deleted' => false]);
                    $this->view->pageTitle = 'الاصناف';
                    $this->view->render();

                }
            } else {
                if ($this->model == "Category")
                    $category = $this->model;
                else
                    $category = $this->model('Category');
                $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
                $this->view->pageTitle = 'الاصناف';
                $this->view->render();
            }


        }


    }


}


?>
