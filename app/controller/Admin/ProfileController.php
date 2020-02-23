<?php


namespace Admin;

use auth\Permissions;
use Controller;
use Helper;
use Session;

class ProfileController extends Controller
{
    public function index()
    {
        $id=Session::get('user')['user_id'];
        $profileInfo = $this->model('Profile');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'profile' . DIRECTORY_SEPARATOR . 'index', ['profile' => $profileInfo->ProfileUser($id), 'deleted' => false]);
        $this->view->pageTitle = 'تعديل الملف الشخصي';
        $this->view->render();
    }
    public  function EditProfile()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST")
        {


            $id=Session::get('user')['user_id'];

            $logo="";
            $logo=empty($_FILES['image']['name'])?$logo=$_REQUEST['old_image']: Helper::saveImage('image', 'images/users/profiles/');

            $pass="";
            $pass=empty($_REQUEST['new_user_password'])?$pass=$_REQUEST['old_user_password']:\Hashing::init($_REQUEST['new_user_password']);
            if (isset($_FILES['document']['name']))
                $document = Helper::saveImage('document', 'images/users/universities/document/');
            $proileStudentInfo= array(
                ':full'=>htmlentities($_REQUEST['user_full_name']),
                ':image'=>$logo,
                ':document'=>$document,
                ':phone'=>$_REQUEST['user_phone'],
                ':email'=>htmlentities($_REQUEST['user_email']),
                ':user_name'=>htmlentities($_REQUEST['user_name']),
                ':pass'=>$pass,
                ':id'=>$id

            );
            $pefileUserModel= $this->model('Profile');
            $profileInfo=  $pefileUserModel->UpdateData($proileStudentInfo);
            // $profileInfo= $pefileUserModel->UpdateDataUser($proileStudentInfo);

            //return var_dump($profileInfo);

            if ($profileInfo) {
                Helper::back('/admin/profile/index', 'Update data successfully', 'success');
                return;

            } else {
                Helper::back('/admin/profile/index', 'error in required input', 'danger');
                return;
            }


        }
    }


}