<?php

/**
 *
 */
namespace Admin;

use Controller;
use Helper;
use Message;
use Session;
use Validation;

class CategoriesController extends Controller
{


    public function index()
    {
        Helper::viewAdminFile();


        $category = $this->model('Category');
//        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => [], 'deleted' => false]);
        $this->view->pageTitle = 'الاصناف';
        $this->view->render();
    }

    public function create()
    {

        Helper::viewAdminFile();

        $category = $this->model('Category');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['categories']);
        $this->view->pageTitle = 'الاصناف';
        $this->view->render();
    }


    public function edit($id)
    {

        Helper::viewAdminFile();

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
                    ':isMain' =>  (isset($_REQUEST['isMain'])== 'on' ? 1 : 0),
                    ':liveNews' =>  (isset($_REQUEST['liveNews']) == 'on' ? 1 : 0),
                    ':hasSlides' =>  (isset($_REQUEST['hasSlides'])== 'on' ? 1 : 0),
                    ':sort' => htmlentities($_REQUEST['sort']),
                    ':status' =>  (isset($_REQUEST['status']) ? 1 : 0),
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
