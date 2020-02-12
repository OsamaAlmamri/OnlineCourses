<?php


class Profile_site
{
    protected $db;

    function __construct()
    {
        $this->db= new Model();
    }

// return all row of table of courses

    public function ProfileUser($id)
    {

        return $this->db->query("select * from profiles INNER JOIN users ON profiles.user_id = users.user_id where users.`user_id`=$id");

    }
    public function UpdateDataUser(array $args)
    {

        $data = $this->db->preparation('update profiles  inner join  users on profiles.user_id = users.user_id
                                 set user_full_name=:full,user_image=:image,user_phone=:phone,user_gender=:gender,
                                user_qualification=:qualification,user_email=:email,user_name=:user_name,user_password=:pass 
                                WHERE users.`user_id`=:id');

        return   $data->execute($args);
    }
}