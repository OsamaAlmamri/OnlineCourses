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

    public function averageRating($id)
    {
        return $this->db->query("SELECT 
                                            COUNT(rating_id) AS total_rating,
                                            FORMAT(SUM(rating_number)/COUNT(rating_number), 1)  AS average_rating 
                                    FROM 
                                            ratings 
                                    WHERE
                                            course_id=$id 
                                    GROUP by
                                             course_id
                                          
        ");
    }


    public function chapterLessons($id, $chapter)
    {
        return $this->db->query("select * from course_resources WHERE course_id =$id and resources_chapter like '$chapter' ");
    }

    public function count_lessons($id)
    {
        return $this->db->query("select count(course_id) as count from course_resources WHERE course_id =$id  ")[0]['count'];
    }

    public function chapterNames($id)
    {
        return $this->db->query("select distinct resources_chapter from course_resources  WHERE course_id =$id  ");
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
