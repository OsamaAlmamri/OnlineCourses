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

class RoleController extends Controller
{


    public function index()
    {

        Helper::viewAdminFile();
        $role = $this->model('Role');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'role' . DIRECTORY_SEPARATOR . 'index', ['Role' => $role->all(), 'deleted' => false]);
        $this->view->pageTitle = 'Role';
        $this->view->render();
    }

    public function active()
    {
        $data = array(
            ':role_id' => htmlentities($_REQUEST['data_id']),
            ':role_status' => htmlentities(($_REQUEST['status'] == 1) ? 0 : 1),
        );
        $user = $this->model('Role');
        $status = ($user->activeRoleByAdmin($data));
        echo ($_REQUEST['status'] == 1) ? 0 : 1;
    }
    public function create()
    {

        Helper::viewAdminFile();

        $category = $this->model('Role');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'role' . DIRECTORY_SEPARATOR . 'createOrUpdate');
        $this->view->pageTitle = 'Roles Add';
        $this->view->render();
    }
    public function store()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
//            $validate = \Validation::required(['', 'password', 'email', 'username']); //sure that first element in array most be null
            $validate = Validation::validate([
                'role_name' => array(['required' => 'required']),
                'role_description' => array(['required' => 'required']),


            ]);
            if (count($validate) == 0) {
                $role = array(

                    ':role_name' => htmlentities($_REQUEST['role_name']),
                    ':role_description' => htmlentities($_REQUEST['role_description']),
                );
                $this->model('Role');
                $id = $this->model->add($role);
                if ($id) {
                    Helper::back('/admin/role/index', 'add successfully', 'success');
                    return;
                }
            } else {
                Helper::back('/admin/role/index', 'error in required input', 'danger');
                return;
            }
        }


    }


    private function storeRolePermission($permissions, $role_id)
    {
        foreach ($permissions as $p) {
            $role = array(
                ':role_id' => $role_id,
                ':permission_id' => $p,
            );
//            return var_dump()
            $id = $this->model->addPermissionRole($role);
        }
        return;


    }

    public function edit($id)
    {
//        Permissions::getInstaince()->allow('role_edit');
        $roleModel = $this->model('Role');
        $role = $roleModel->find($id);
        $oldRolePermission = $roleModel->getPermissions($id);
        $permissions = [];
        foreach ($oldRolePermission as $p) {
            $permissions[] = $p['permission_id'];

        }
//        return var_dump($permissions);
        $this->view('admin' . DIRECTORY_SEPARATOR . 'role' . DIRECTORY_SEPARATOR . 'createOrUpdate', ['role' => $role, 'oldRolePermission' => $permissions, 'permissions' => $this->getPermission(), 'type' => 'update']);
        $this->view->pageTitle = 'تحديث الادوار';
        $this->view->render();
    }


    public function update()
    {

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $validate = Validation::validate([
                'role_name' => array(['required' => 'required']),
                'role_description' => array(['required' => 'required']),


            ]);

            if (count($validate) == 0) {
                $role = array(

                    ':role_id' => htmlentities($_REQUEST['role_id']),
                    ':role_name' => htmlentities($_REQUEST['role_name']),
                    ':role_description' => htmlentities($_REQUEST['role_description']),
                );
                $this->model('Role');
                $id = $this->model->update($role);


                if ($id) {
                    if (isset($_REQUEST['permissions'])) {
                        $this->model->deleteOldPermission($_REQUEST['role_id']);

                        $this->storeRolePermission($_REQUEST['permissions'], $id);
//                        return var_dump($_REQUEST['permissions'] );
                    }
                    Helper::back('/admin/role/index', 'تم التعديل بنجاح', 'success');
                    return;
                }
            } else {
                Helper::back('/admin/role/edit/' . $_REQUEST['role_id'], 'خطاء في المدخلات', 'danger');
                return;
            }
        }
//


    }

}


?>
