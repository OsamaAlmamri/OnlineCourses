<?php


namespace Admin;

use Controller;
use Helper;

class CommentsController extends Controller
{

    public function index(){
        Helper::viewAdminFile();
        $comments= $this->model('comment');
        $this->view('admin' . DIRECTORY_SEPARATOR . 'comments' . DIRECTORY_SEPARATOR . 'index', ['courses' => $comments->all(), 'deleted' => false]);
        $this->view->pageTitle = 'Comments';
        $this->view->render();
    }

    public function addComment()
    {

        $data = array(
            ':course_id' => htmlentities($_REQUEST['course_id']),
            ':user_id' => htmlentities($_REQUEST['user_id']),
            ':comment_text' => htmlentities($_REQUEST['commentText'])
        );
        $comment = $this->model('Comment');
        $idComment = $comment->addComments($data);
        $commentData=$comment->getCommentById($idComment);
        $data =  json_encode($commentData);
        echo $data;

    }

    public function getCommentById()
    {

    }




}