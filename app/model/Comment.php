<?php


class Comment
{
    protected $db;

    function __construct()
    {
       return $this->db = new Model();
    }

    // get all row from Comments Table
   public function all(){
       return $this->db->query("select * from comments");
    }

    public function allCommentsOfCourse($id)
    {
        return $this->db->query("SELECT * FROM comments inner join profiles on comments.user_id=profiles.user_id WHERE course_id=$id");
    }
    public function getInFoTableByField($tableName,$filedName,$filedValue)
    {
        return $this->db->query("select * from $tableName where course_id=$filedValue");
    }


    public function getCommentById($id)
    {
        return $this->db->query("select * from comments where comment_id=$id");
    }


    public function addComments(array $Data)
    {

        $Stmt = $this->db->preparation('INSERT INTO comments (comment_text, user_id,course_id,comment_status,comment_date)
                                                  VALUES ( :comment_text,:user_id,:course_id,1,:comment_date)');
        $Stmt->execute($Data);
        return $this->db->lastInsertId();

    }



}