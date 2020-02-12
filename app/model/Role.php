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

    public function find($id)
    {
        return $this->db->query("select * from roles WHERE role_id =$id");
    }


    public function getRoleByName($name)
    {
        $id = $this->db->fetchOne("select role_id from roles WHERE role_name  like '%" . $name . "%' ");
        return ($id['role_id']);
    }

    public function getPermissions($id)
    {
        $per = $this->db->query("select permission_id from permission_role WHERE role_id  =$id");
        return ($per);
    }



    public function deleteOldPermission($id)
    {
        $oStmt = $this->db->preparation('delete from  permission_role  WHERE role_id LIKE  ? ');
        return $oStmt->execute(array(0 => $id));
    }

    public function activeRoleByAdmin(array $aData)
    {
//        return var_dump($aData);
        $oStmt = $this->db->preparation('update  roles set role_status =:role_status where role_id=:role_id');
        return $oStmt->execute($aData);

    }

    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO roles (role_name,role_description,role_status )
                                                  VALUES (:role_name , :role_description, 1)');
        $oStmt->execute($aData);
        return $this->db->lastInsertId();

    }


    public function update(array $aData)
    {

        $oStmt = $this->db->preparation('update  roles set role_name =:role_name, role_description=:role_description
                                                  where role_id=:role_id
                                                  ');
        return $oStmt->execute($aData);

    }


    public function addPermissionRole(array $aData)
    {
        $oStmt = $this->db->preparation('INSERT INTO permission_role ( permission_id,role_id)
                                                  VALUES (:permission_id, :role_id)');

        return $oStmt->execute($aData);

    }

}


?>
