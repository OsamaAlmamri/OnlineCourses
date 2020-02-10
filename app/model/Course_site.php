<?php


class Course_site
{
    protected $db;

    function __construct()
    {
        $this->db= new Model();
    }

// return all row of table of courses
    public function all()
    {
        return $this->db->query("select * from courses");
    }
    public function insertInToUsersCourses(array $aData)
    {

        $insertIntoUserCourses = $this->db->preparation('INSERT INTO `users_courses`( `user_id`,user_wish_list) 
                                 VALUES (:user_id ,:user_wish_list)');
        $insertIntoUserCourses->execute($aData);
        return $this->db->lastInsertId();

    }
    public function latestCoursesWebsite()
    {
        return $this->db->query("SELECT * FROM courses ORDER BY course_id DESC LIMIT 6
");

    }


}
?>
