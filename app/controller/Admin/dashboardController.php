<?php


namespace admin;


use Helper;

class dashboardController extends \Controller
{
    public function index()
    {
        Helper::viewAdminFile();
        $this->model('Course');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'index', ['news' => $this->model->all()]);

        $this->view->pageTitle = 'admin index';
        $this->view->render();

    }

}