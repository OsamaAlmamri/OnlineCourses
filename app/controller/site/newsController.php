<?php

/**
 *
 */
namespace site;
class newsController extends \Controller
{

    public function index()
    {
        $this->model('Course');
        $this->view('news' . DIRECTORY_SEPARATOR . 'index', ['news' => $this->model->all()]);

        $this->view->pageTitle = 'This Page of news Index';
        $this->view->render();

    }


    public function page($id)
    {
//        return var_dump($id);
        $this->model('Course');
//        return var_dump($this->model->page($id));
        $this->view('home' . DIRECTORY_SEPARATOR . 'index', ['news' => $this->model->page($id)]);

        $this->view->pageTitle = 'الاخبار';
        $this->view->render();

    }


    public function readMore($id)
    {
//        return var_dump($id);
        $this->model('Course');
//        return var_dump($this->model->find($id));
        $this->view('home' . DIRECTORY_SEPARATOR . 'readMore', ['news' => $this->model->find($id)[0]]);

        $this->view->pageTitle = 'عرض المزيد';
        $this->view->render();

    }


}


?>
