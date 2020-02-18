00<?php


class rating
{
    protected $db;

    function __construct()
    {
        return $this->db = new Model();
    }

    // get all row from rating Table
    public function all()
    {
        return $this->db->query("select * from ratings");
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

    public function getTotalForEachRating_For_SpecificCourse($id)
    {
        return $this->db->query("SELECT 
                                            COUNT(rating_number) AS total_for_each_rating,
                                            rating_number
                                    FROM 
                                            ratings 
                                    WHERE
                                            course_id=$id 
                                    GROUP by
                                             rating_number
                                          
        ");
    }


    public function allRatingsOfCourse($id)
    {
        return $this->db->query("  SELECT *
                                    FROM 
                                            ratings inner join profiles
                                    on
                                            ratings.user_id = profiles.user_id 
                                    WHERE
                                             ratings.course_id=$id 
                                       
        ");
    }


    public function getInFoTableByField($tableName, $filedName, $filedValue)
    {
        return $this->db->query("select * from $tableName where course_id=$filedValue");
    }


    public function getRatingById($id)
    {
        return $this->db->query("select * from ratings where Rating_id=$id");
    }


    public function checkIfUserHasRated($user_id, $course_id)
    {
        return $this->db->query("select * from ratings where user_id=$user_id and course_id=$course_id");
    }

    public function addRating(array $Data)
    {
        $Stmt = $this->db->preparation('INSERT INTO ratings 
                                            ( comment_text, 
                                            rating_number,
                                            rating_date, 
                                            user_id, 
                                            rating_status,
                                            course_id)
                                            VALUES 
                                            (:comment_text,
                                            :rating_number,
                                            :rating_date,
                                            :user_id,
                                            1,
                                            :course_id
                                            )'
        );
        $Stmt->execute($Data);
        return $this->db->lastInsertId();

    }

    public function deleteRating($data)
    {
        $Stmt = $this->db->preparation("DELETE FROM ratings where user_id=:user_id AND course_id=:course_id");
        $Stmt->execute($data);
        return;
    }


}