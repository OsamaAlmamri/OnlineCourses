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
        return $this->db->query("select * from courses WHERE id =$id");


    }
    // ':course_title' => htmlentities($_REQUEST['category_description']),
    //                    ':course_description' => htmlentities($_REQUEST['category_description']),
    //                    ':courses_image' => $image,
    //                    ':course_price' => htmlentities($_REQUEST['category_description']),
    //                    ':course_price_afterDiscount' => htmlentities($_REQUEST['category_description']),
    //                    ':course_students_target' => htmlentities($_REQUEST['category_name']),
    //                    ':course_goals' => htmlentities($_REQUEST['course_goals']),
    //                    ':categories_ids' => htmlentities($_REQUEST['course_goals']),


    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO courses (  course_title, course_description, courses_image,course_price,course_price_afterDiscount,
                                                                    course_students_target,course_goals,categories_ids)
                                                  VALUES (  :course_title, :course_description, :courses_image,:course_price,:course_price_afterDiscount,
                                                  :course_students_target,:course_goals,:categories_ids)');
        $oStmt->execute($aData);
        return $this->db->lastInsertId();

    }

}


?>
