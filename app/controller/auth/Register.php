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

    private $code;

    function __construct($userData = '', $status = 0, $role = 'student')
    {

        if ($userData != '') {
            $this->user_name = $userData["user_name"];
            $this->user_full_name = $userData["user_full_name"];
            $this->email = $userData["user_email"];
            $this->password = $userData["user_password"];
            $this->user_phone = $userData["user_phone"];
            $this->user_gender = $userData["user_gender"];
            $this->role_name = $userData["role_name"];
            $this->user_qualification = isset($userData["user_qualification"]) ?: '';
            $this->status = $status;
        }
    }


    public function register($type)
    {


        $this->view('home' . DIRECTORY_SEPARATOR . 'login', ['active' => "singUP"]);
        $this->view->pageTitle = 'SingUp';
        $this->view->render();
    }

    public function signUp($type, $status)
    {


//INSERT INTO `users` (`user_id`, `user_email`, `user_name`, `user_password`, `user_activation_key`, `user_status`) VALUES (NULL, 'straw4lllhat@gmail.com', 'alik', '1', '23', '0');
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
//            $validate = \Validation::required(['', 'password', 'email', 'username']); //sure that first element in array most be null
            $validate = \Validation::validate([
                'user_password' => array(['required' => 'required', 'min' => '6', 'confirmed' => 'password_confirmation']),
                'user_email' => array(['required' => 'required', 'unique' => array('users', 'user_email')]),
                'user_full_name' => array(['required' => 'required', 'minWords' => 2, 'maxWords' => 5]),
                'user_name' => array(['required' => 'required', 'unique' => array('users', 'user_name')]),
            ]);
            if (count($validate) == 0) {
                $user = array(
                    ':user_email' => htmlentities($this->email),
                    ':user_name' => htmlentities($this->user_name),
                    ':user_password' => \Hashing::init($this->password),
                    ':user_activation_key' => $this->generateCode(),
                    ':user_status' => $status,
                );
                $this->model('Users');
                $id = $this->model->add($user);
                if ($id) {
                    $this->sendEmail();
                    $this->addUserProfile($id);
                    $this->addUserRole($id);

                    Helper::backToLogin('see your email to confirm your account', 'success');
                    return;
                }
            } else {
                Helper::backToRegister($validate, 'error');
                return;
            }
        }
        Helper::backToLogin(' ', 1);
        return;

    }


    private function addUserProfile($id)
    {


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