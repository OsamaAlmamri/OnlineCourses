<?php
/**
 *
 */

class PermissionRole
{
    protected $data_file;
    protected $db;


    function __construct()
    {
        $this->db = new Model();
    }


//
    public function getPermissions($id)
    {
        $per = $this->db->query("select permission_id from permission_role WHERE role_id  =$id");
        return ($per);
    }


    public function getPermissionByName($name)
    {
        $id = $this->db->fetchOne("select permission_id from permissions WHERE permission_name  like '" . $name . "' ");
        if ($id == false)
            return 0;
        return ($id['permission_id']);
    }


}


?>
