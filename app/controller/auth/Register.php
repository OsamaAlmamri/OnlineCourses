<?php


namespace auth;


use Controller;
use Helper;

class Register extends Controller
{

    private $user_name;
    private $user_full_name;
    private $user_phone;
    private $user_qualification;
    private $email;
    private $password;
    private $user_gender;
    private $status;
    private $role_name;
    private $university_id;

    private $code;

    function __construct($userData = '', $status = 0, $role = 'student', $university_id = 0)
    {

        if ($userData != '') {
            $this->user_name = $userData["user_name"];
            $this->user_full_name = $userData["user_full_name"];
            $this->email = $userData["user_email"];
            $this->password = $userData["user_password"];
            $this->user_phone = $userData["user_phone"];
            $this->user_gender = isset($userData["user_gender"]) ? $userData["user_gender"] : '';
            $this->role_name = isset($userData["role_name"]) ? $userData["role_name"] : $role;
            $this->user_qualification = isset($userData["user_qualification"]) ?: '';
            $this->status = $status;


        }
    }


    public function register($type)
    {
        $this->view('home' . DIRECTORY_SEPARATOR . 'register', ['type' => $type]);
        $this->view->pageTitle = 'SingUp';
        $this->view->render();
    }

    public function signUp($type, $status)
    {
//        return var_dump($_REQUEST);

        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $universityRequired = [];
            if ($this->role_name == 'university')
                $universityRequired = ['document' => array(['imageRequired' => 'imageRequired'])];
            $validate = \Validation::validate(array_merge($universityRequired, [
                'user_password' => array(['required' => 'required', 'min' => '6', 'confirmed' => 'password_confirmation']),
                'user_email' => array(['required' => 'required', 'unique' => array('users', 'user_email')]),
                'user_full_name' => array(['required' => 'required', 'minWords' => 2, 'maxWords' => 5]),
                'user_name' => array(['required' => 'required', 'unique' => array('users', 'user_name')]),
            ]));
            if (count($validate) == 0) {
                $user = array(
                    ':user_email' => htmlentities($this->email),
                    ':user_name' => htmlentities($this->user_name),
                    ':university_id' => ($this->role_name == 'teacher' and $_SESSION['role_name'] == 'university') ? \Session::logged() : $this->university_id,
                    ':user_password' => \Hashing::init($this->password),
                    ':user_activation_key' => $this->generateCode(),
                    ':user_status' => $status,
                );
                $this->model('Users');
                $id = $this->model->add($user);
                if ($id) {
                    if ($this->role_name != "teacher")
                        $this->sendEmail();
                    $this->addUserProfile($id);
                    $this->addUserRole($id);
                    if ($this->role_name != "teacher") {
                        if ($this->role_name == 'university')
                            Helper::back('/home/register/university', 'see your email to confirm your account', 'success');
                        else
                            Helper::back('/home/register/student', 'see your email to confirm your account', 'success');


                    } else
                        Helper::back('/admin/teachers/index', 'teacher add successfully', 'success');
                    return;
                }
            } else {
                if ($this->role_name != "teacher")
                    Helper::backToRegister($validate, 'error', $this->role_name);
                else
                    Helper::back('/admin/teachers/create', 'there is error', 'warning');

                return;
            }
        }
        if ($this->role_name != "teacher")
            Helper::backToLogin(' ', 1);
        else
            Helper::back('/admin/teachers/create', 'there is error', 'warning');

        return;

    }


    private function addUserProfile($id)
    {

        $document = '';
        if (isset($_FILES['user_image']['name']))
            $logo = Helper::saveImage('user_image', 'images/users/profiles/');
        if (isset($_FILES['document']['name']))
            $document = Helper::saveImage('document', 'images/universities/document/');
        $profile = array(
            ':user_id' => $id,
            ':user_full_name' => htmlentities($this->user_full_name),
            ':user_phone' => htmlentities($this->user_phone),
            ':user_gender' => htmlentities($this->user_gender),
            ':user_image' => $logo,
            ':document' => $document,
            ':user_qualification' => htmlentities($this->user_qualification),
            ':user_register_date' => date("D- y/m/j  h-i-s ")
        );
        $this->model('Profile');
        return $this->model->add($profile);
    }

    private function addUserRole($user_id)
    {
        $this->model('Role');
        $role = array(
            ':user_id' => $user_id,
            ':role_id' => $this->model->getRoleByName($this->role_name),
        );

        $this->model('UserRole');
        return $this->model->add($role);
    }

    private function generateCode()
    {
        $this->code = rand(1000, 9999);
        return $this->code;
    }

    private function sendEmail()
    {
        $headers = '';
        $activation_link = Helper::siteUrl() . "/home/activation.php?u_email=" . $this->email . "&code=" . $this->code;
        $from = Helper::siteEmail();
        $headers .= 'From: ' . $from . "\r\n" .
            'Reply-To: ' . $from . "\r\n" .
            'X-Mailer: PHP/' . phpversion();
        $msg = "<body>
                    thank you for register in " . Helper::siteName() . " site  <br>
	                to confirm your account click here  <p >" . $activation_link . "</p>
		        </body>";
        mail($this->email, "confirm your account here", $msg, $headers);

    }


}