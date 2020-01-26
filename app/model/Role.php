<?php
/**
 *
 */

class Role
{
    protected $data_file;
    protected $db;
    protected $inventory = [];

    function __construct()
    {
        $this->db = new Model();
    }

// return all row of table of users
    public function all()
    {
        return $this->db->query("select * from roles");
    }


    public function roleName($id)
    {
        return $this->db->fetchOne("select role_name , user_role_id from roles 
                                        INNER JOIN user_role ON roles.role_id = user_role.role_id WHERE user_id =$id");

    }

    public function getRoleByName($name)
    {
        $id = $this->db->fetchOne("select role_id from roles WHERE role_name  like '%" . $name . "%' ");
        return ($id['role_id']);
    }

}


?>
