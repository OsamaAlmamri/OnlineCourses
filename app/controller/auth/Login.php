<?php


namespace auth;

use Controller;
use Hashing;
use Helper;
use Session;
use site\homeController;

class Login extends Controller
{
    public function __construct()
    {

    }


    public function login($type)
    {


        $this->view('home' . DIRECTORY_SEPARATOR . 'login', ['active' => "Login"]);

        $this->view->pageTitle = 'login';
        $this->view->render();
    }


    public function PostLogin()
    {
        $homeController = new homeController;
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
//            $validate = Validation::required(['', 'username', 'password']);
            $validate = \Validation::validate([
                'password' => array(['required' => 'required']),
                'username' => array(['required' => 'required']),
            ]);

            if (count($validate) == 0) {
                $password = Hashing::init($_REQUEST['password'])->__toString();
                $userForm = array(':username' => $_REQUEST['username'], ':password' => $password);
                $this->model('Users');
                $user = $this->model->Login($userForm);
                if ($user == 0 || $user['user_status'] == 0) {
                    if ($user == 0)
                        Helper::backToLogin('كلمة المرور او اسم المستخدم خطاء ', 'danger');
                    else
                        Helper::backToLogin('حسابك غير مفعل حاليا', 'warning');
                    return;
                } else {
                    $session_data = array(
                        'user_id' => $user['user_id'],
                        'user_name' => $user['user_name'],
                        'role_id' => $this->model->roleName($user['user_id'])['user_role_id'],
                        'role_name' => $this->model->roleName($user['user_id'])['role_name']);
                    Session::loggIn($session_data);

                    if (Session::logged()) {
                        if (Session::get('role_name') == 'admin')
                            Helper::backToDashboard('لقد تم تسجيل الدخول بنجاح', 'success');
                        else
                            Helper::backToHome('لقد تم تسجيل الدخول بنجاح', 'success');

                    }
                }


            } else {
                \Helper::backToLogin($validate, 'error');
                return;
            }
        }
//        $homeController->login();
//        return;


    }


}