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

    public function getPermissionByName($name)
    {
        $id = $this->db->fetchOne("select permission_id from permissions WHERE permission_name  like '" . $name . "' ");
        if ($id == false)
            return 0;
        return ($id['permission_id']);
    }


}


?>
