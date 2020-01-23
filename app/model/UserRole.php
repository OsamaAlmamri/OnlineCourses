<?php
/**
 *
 */

class UserRole
{
    protected $data_file;
    protected $db;
    protected $inventory = [];

    function __construct()
    {
        $this->db = new Model();
    }

    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO user_role ( user_id, role_id)
                                                  VALUES ( :user_id, :role_id )');
        return $oStmt->execute($aData);
//        return $this->db->lastInsertId();

    }


}


?>
