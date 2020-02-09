<?php

/**
 *
 */
namespace Admin;

use auth\Permissions;
use Controller;
use Helper;

class CategoriesController extends Controller
{


    public function index()
    {
        Permissions::getInstaince()->allow('category_index');
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

        Permissions::getInstaince()->allow('category_create');

        $category = $this->model('Category');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'categories' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['MainCategories' => $category->all('0')]);
        $this->view->pageTitle = 'Category';
        $this->view->render();
    }


    public function fetchCategory()
    {

        $this->model('Category');
        $data = $_REQUEST['filter_name'];

        $c = $this->model->fetchCategories($data);
        $c = json_encode($c);
        echo($c);
    }


    public function store()
    {
        Permissions::getInstaince()->allow('category_store');
        $category_parents = 0;
        if ($_REQUEST['main_category_parents'] != 0)
            $category_parents = $_REQUEST['main_category_parents'];

        if ($_REQUEST['sub_category_parents'] != 0)
            $category_parents = 'level3_' . $_REQUEST['sub_category_parents'];

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
                Helper::back('/admin/categories/create', 'error in required input', 'danger');
                return;
            }
        }


    }


}


?>
