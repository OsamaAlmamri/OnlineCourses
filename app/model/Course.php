<?php
/**
 *
 */

class Course
{

    protected $db;

    function __construct()
    {
        $this->db = new Model();
    }

// return all row of table of courses
    public function all()
    {
        return $this->db->query("select * from courses");
    }

    public function page($id)
    {
        return $this->db->query("select * from courses where categories2 like '%\"$id\"%' ");
    }

    public function find($id)
    {
        return $this->db->query("select * from courses WHERE course_id =$id");


    }

    public function activeByAdmin(array $aData)
    {
        $oStmt = $this->db->preparation('update  courses set course_status =:course_status where course_id=:course_id');
        return $oStmt->execute($aData);

    }

    public function visibility(array $aData)
    {
        $oStmt = $this->db->preparation('update  courses set course_visibility =:course_visibility where course_id=:course_id');
        return $oStmt->execute($aData);

    }

    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO courses ( course_owner, course_title, course_description, courses_image,course_price,course_price_afterDiscount,
                                                                    course_students_target,course_goals,categories_ids)
                                                  VALUES ( :course_owner, :course_title, :course_description, :courses_image,:course_price,:course_price_afterDiscount,
                                                  :course_students_target,:course_goals,:categories_ids)');
        $oStmt->execute($aData);
        return $this->db->lastInsertId();

    }

}


?>
