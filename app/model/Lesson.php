<?php
/**
 *
 */

class Lesson
{

    protected $db;

    function __construct()
    {
        $this->db = new Model();
    }

// return all row of table of course_resources
    public function all()
    {
        return $this->db->query("select * from course_resources");
    }

    // return all row of table of course_resources
    public function course_lessons($id)
    {
        return $this->db->query("select * from course_resources  WHERE course_id =$id");
    }


    public function find($id)
    {
        return $this->db->query("select * from course_resources WHERE id =$id");


    }

    public function activeByAdmin(array $aData)
    {
        $oStmt = $this->db->preparation('update  course_resources set course_status =:course_status where course_id=:course_id');
        return $oStmt->execute($aData);

    }

    public function visibility(array $aData)
    {
        $oStmt = $this->db->preparation('update  course_resources set course_visibility =:course_visibility where course_id=:course_id');
        return $oStmt->execute($aData);

    }

    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO course_resources ( resources_chapter, course_id, resources_video)
                                                  VALUES ( :resources_chapter,  :course_id, :resources_video)');
        $oStmt->execute($aData);
        return $this->db->lastInsertId();

    }

    public function getChapters($course)
    {

        $likeVar = "%" . $course . "%";

        $oStmt = $this->db->preparation('SELECT distinct resources_chapter as id ,resources_chapter as name FROM course_resources WHERE resources_chapter  LIKE  ? ');
        $oStmt->execute(array(0 => $likeVar));
        return $oStmt->fetchAll();

    }

}


?>
