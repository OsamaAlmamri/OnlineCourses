<?php
namespace site;
use auth\Activation;
use auth\login;
use auth\LogOut;
use auth\Register;
use Session;
use Controller;
class wishListController extends Controller {

    public function index()
    {
        $wish_list=$this->model('Course_site');
        $user_id=Session::get('user')['user_id'];
        $this->view('website' . DIRECTORY_SEPARATOR . 'wish_list', ['wish_list' => $wish_list->wishListCourseUser($user_id) ,'deleted' => false]);
        $this->view->pageTitle ='قائمة مفضلاتي';
        $this->view->render();
    }
}
?>
