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
    public function insertInToUsersCourses($args=array())
    {
        return $this->db->Insert("insert into users_courses(user_id,couces_buy) 
values(:user_id,:course_buy)",$args);
    }
    public function latestCoursesWebsite()
    {
        return $this->db->query("SELECT * FROM courses ORDER BY course_id DESC LIMIT 6
");
    }

}
?>