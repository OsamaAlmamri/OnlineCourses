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
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'index', ['categories' => $category->all(), 'deleted' => false]);
        $this->view->pageTitle = 'Category';
        $this->view->render();
    }


    public function active()
    {
        $data = array(
            ':category_id' => htmlentities($_REQUEST['data_id']),
            ':category_status' => htmlentities(($_REQUEST['status'] == 1) ? 0 : 1),
        );
        $user = $this->model('Category');
        $status = ($user->activeByAdmin($data));
        echo ($_REQUEST['status'] == 1) ? 0 : 1;
    }


    public function visibility()
    {
        $data = array(
            ':category_id' => htmlentities($_REQUEST['data_id']),
            ':category_visibility' => htmlentities(($_REQUEST['visibility'] == 1) ? 0 : 1),
        );
        $user = $this->model('Category');
        $status = ($user->visibility($data));
        echo ($_REQUEST['visibility'] == 1) ? 0 : 1;
    }

    public function fetchSubCategories()
    {
        $category = $this->model('Category');
        $options = '<option value="0"> --</option>';
        foreach ($category->all($_REQUEST['category_parents']) as $cat) {
            $options .= '<option value=' . $cat['category_id'] . '>' . $cat['category_name'] . '</oprion>';
        }
        echo($options);

    }

    public function create()
    {

        Helper::viewAdminFile();

        $category = $this->model('Category');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['MainCategories' => $category->all('0')]);
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
        $category_parents = 0;
        if ($_REQUEST['sub_category_parents'] != 0)
            $category_parents = $_REQUEST['sub_category_parents'];

//        return var_dump($category_parents);

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
//            $validate = \Validation::required(['', 'password', 'email', 'username']); //sure that first element in array most be null
            $validate = \Validation::validate([
                'category_name' => array(['required' => 'required']),
                'category_description' => array(['required' => 'required']),


            ]);
            if (count($validate) == 0) {
                $category = array(
                    ':category_parents' => $category_parents,
                    ':category_description' => htmlentities($_REQUEST['category_description']),
                    ':category_name' => htmlentities($_REQUEST['category_name']),
                );
                $this->model('Category');
                $id = $this->model->add($category);
                if ($id) {
                    Helper::back('/admin/categories/index', 'add successfully', 'success');
                    return;
                }
            } else {
                Helper::back('/admin/categories/index', 'error in required input', 'danger');
                return;
            }
        }


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
