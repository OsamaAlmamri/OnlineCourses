<?php


namespace site;


class course_detail extends \Controller
{
    public function index()
    {
        $course_detail=$this->model('Course_site');
        // return var_dump( $course_site->all() );
        $this->view('website' . DIRECTORY_SEPARATOR . 'course_detail', ['courses_detail' => $course_detail->all() ,'deleted' => false]);
        $this->view->pageTitle ='Course_site';
        $this->view->render();
    }
}