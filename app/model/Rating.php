<?php


class rating
{
    protected $db;

    function __construct()
    {
       return $this->db = new Model();
    }

    // get all row from rating Table
   public function all(){
       return $this->db->query("select * from ratings");
    }

    public function allRatingsOfCourse($id)
    {
        return $this->db->query("  SELECT 
                                            ratings.*,
                                            profiles.*,
                                            COUNT(ratings.rating_number) AS rating_number,
                                            FORMAT(SUM(ratings.rating_number)/COUNT(ratings.rating_number), 0)  AS average_rating 
                                    FROM 
                                            ratings inner join profiles
                                    on
                                            ratings.user_id = profiles.user_id 
                                    WHERE
                                            course_id=5
        
        ");
    }



    public function getInFoTableByField($tableName,$filedName,$filedValue)
    {
        return $this->db->query("select * from $tableName where course_id=$filedValue");
    }

    public function getRatingById($id)
    {
        return $this->db->query("select * from ratings where Rating_id=$id");
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



}