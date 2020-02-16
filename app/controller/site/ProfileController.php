<?php


namespace site;

use auth\Activation;
use auth\login;
use auth\LogOut;
use auth\Register;
use Session;
use Validation;
use Controller;
use Helper;


class ProfileController  extends \Controller
{
    public function index()
    {
        $profile_student= $this->model('Profile_site');
        //return var_dump( $profile_student->all() )
        $id=Session::get('user')['user_id'];

        $this->view('website' . DIRECTORY_SEPARATOR . 'profile', ['profile' => $profile_student->ProfileUser($id), 'deleted' => false]);

        $this->view->pageTitle = 'Profile_site';
        $this->view->render();
    }
    public  function EditUser()
    {
        if ($_SERVER["REQUEST_METHOD"] == "POST")
        {

//            $validate =\Validation::validate([
//                'user_password' => array(['required' => 'required', 'min' => '6', 'confirmed' => 'password_confirmation']),
//                'user_email' => array(['required' => 'required', 'unique' => array('users', 'user_email')]),
//                'user_full_name' => array(['required' => 'required', 'minWords' => 2, 'maxWords' => 5]),
//                'user_name' => array(['required' => 'required', 'unique' => array('users', 'user_name')]),
//            ]);
//            if (count($validate) == 0) {
            $id=Session::get('user')['user_id'];
            $logo="";
            $logo=empty($_FILES['image']['name'])?$logo=$_REQUEST['old_image']: Helper::saveImage('image', 'images/users/profiles/');

            $pass="";
            $pass=empty($_REQUEST['new_user_password'])?$pass=$_REQUEST['old_user_password']:\Hashing::init($_REQUEST['new_user_password']);
            $proileStudentInfo= array(
                ':full'=>htmlentities($_REQUEST['user_full_name']),
                ':image'=>$logo,
                ':phone'=>$_REQUEST['user_phone'],
                ':gender'=>$_REQUEST['user_gender'],
                ':qualification'=>$_REQUEST['user_qualification'],
                ':email'=>htmlentities($_REQUEST['user_email']),
                ':user_name'=>htmlentities($_REQUEST['user_name']),
                ':pass'=>$pass,
                ':id'=>$id

            );
            $pefileUserModel= $this->model('Profile_site');
            $profileInfo=  $pefileUserModel->UpdateDataUser($proileStudentInfo);
            // $profileInfo= $pefileUserModel->UpdateDataUser($proileStudentInfo);

            // return var_dump($profileInfo);

            if ($profileInfo) {
                Helper::back('/profile/', 'Update data successfully', 'success');
                return;

            } else {
                Helper::back('/profile/', 'error in required input', 'danger');
                return;
            }


        }
    }
    // }



}