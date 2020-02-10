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

class PermisionController extends Controller
{


    public function index()
    {
        Helper::viewAdminFile();
        $permision = $this->model('Permision');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'permision' . DIRECTORY_SEPARATOR . 'index', ['permision' => $permision->all(), 'deleted' => false]);
        $this->view->pageTitle = 'Permision';
        $this->view->render();
    }


    public function active()
    {
        $data = array(
            ':permission_id' => htmlentities($_REQUEST['data_id']),
            ':permission_status' => htmlentities(($_REQUEST['status'] == 1) ? 0 : 1),
        );
        $user = $this->model('Permision');
        $status = ($user->activePermisionByAdmin($data));
        echo ($_REQUEST['status'] == 1) ? 0 : 1;
        return var_dump($status);
    }

    public function create()
    {

        Helper::viewAdminFile();

        $Permision = $this->model('Permision');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'permision' . DIRECTORY_SEPARATOR . 'createOrUpdate');
        $this->view->pageTitle = 'Permision';
        $this->view->render();
    }
public function store()
    {
 if ($_SERVER["REQUEST_METHOD"] == "POST") {
     $validate = \Validation::validate([
                'permission_name' => array(['required' => 'required']),
                'permissions_description' => array(['required' => 'required']),
     ]);
            if (count($validate) == 0) {
                $Permision = array(
                   
                    ':permission_name' => htmlentities($_REQUEST['permission_name']),
                    ':permissions_description' => htmlentities($_REQUEST['Permision_name']),
                );
                $this->model('Permision');
                $id = $this->model->add($Permision);
                if ($id) {
                    Helper::back('/admin/permision/index', 'add successfully', 'success');
                    return;
                }
            } else {
                Helper::back('/admin/permision/index', 'error in required input', 'danger');
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

                $this->model('Permision');
                if ($this->model->update($cate)) {
                    Message::setMessage('msgState', 1);
                    Message::setMessage('main', 'تم تعديل القسم  بنجاح');
//                    $news = $this->model('Course');
                    $this->view('admin' . DIRECTORY_SEPARATOR . 'permision' . DIRECTORY_SEPARATOR . 'index', ['permision' => $this->model->all(), 'deleted' => false]);
                    $this->view->pageTitle = 'الاصناف';
                    $this->view->render();

                }
            } else {
                if ($this->model == "Permision")
                    $Permision = $this->model;
                else
                    $Permision = $this->model('Permision');
                $this->view('admin' . DIRECTORY_SEPARATOR . 'permision' . DIRECTORY_SEPARATOR . 'index', ['permision' => $Permision->all(), 'deleted' => false]);
                $this->view->pageTitle = 'الاصناف';
                $this->view->render();
            }


        }


    }


}


?>
