<?php

/**
 *
 */
namespace Admin;

use auth\Permissions;
use auth\Register;
use Controller;
use Helper;
use Message;

class UniversitiesController extends Controller
{


    public function index()
    {
        $p = new Permissions();
        $p->allow('university_index');

        $role = $this->model('Role');
        $role_id = ($role->getRoleByName('university'));
        $users = $this->model('Users');
//        return var_dump( $users->all($role_id));
        $this->view('admin' . DIRECTORY_SEPARATOR . 'universities' . DIRECTORY_SEPARATOR . 'index', ['universities' => $users->all($role_id), 'deleted' => false]);
        $this->view->pageTitle = 'universities';
        $this->view->render();
    }

    public function active()
    {
        $data = array(
            ':user_id' => htmlentities($_REQUEST['data_id']),
            ':user_status' => htmlentities(($_REQUEST['status'] == 1) ? 0 : 1),
        );
        $user = $this->model('Users');
        $status = ($user->activeByAdmin($data));
        echo ($_REQUEST['status'] == 1) ? 0 : 1;
    }

    public function create()
    {

        $p = new Permissions();
        $p->allow('university_create');

        $category = $this->model('Category');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'universities' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['categories']);
        $this->view->pageTitle = 'universities';
        $this->view->render();
    }


    public function edit($id)
    {

        $p = new Permissions();
        $p->allow('university_edit');

        $CatModel = $this->model('Category');
        $category = $CatModel->find($id)[0];
//        return var_dump($news);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'create', ['category' => $category, 'type' => 'update']);

//        $this->view('admin' . DIRECTORY_SEPARATOR . 'news' . DIRECTORY_SEPARATOR . 'create', ['news' => $news]);
        $this->view->pageTitle = 'الاصناف';
        $this->view->render();
    }

    public function addTeacher()
    {
//        return var_dump($_REQUEST);
        $p = new Permissions();
        $p->allow('university_addTeacher');
        $auth = new Register($_REQUEST,1,'teacher');
        $auth->signUp('teacher', 0);

    }

    public function delete($id)
    {
        $p = new Permissions();
        $p->allow('university_delete');
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


}


?>
