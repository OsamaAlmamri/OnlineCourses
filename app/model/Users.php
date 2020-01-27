<?php
/**
 *
 */

class Users
{
    protected $data_file;
    protected $db;
    protected $inventory = [];

    function __construct()
    {
        $this->db = new Model();
    }

// return all row of table of users
    public function all($type)
    {

        return $this->db->query("select *  from(( profiles  INNER JOIN users ON profiles.user_id = users.user_id)
        INNER JOIN user_role ON users.user_id = user_role.user_id) WHERE role_id =$type ");

    }

    public function UniversityTeacher($type, $university_id)
    {

        return $this->db->query("select *  from(( profiles  INNER JOIN users ON profiles.user_id = users.user_id)
        INNER JOIN user_role ON users.user_id = user_role.user_id) WHERE role_id =$type and university_id=$university_id");

    }

//add new row to users table
    public function add(array $aData)
    {

        $oStmt = $this->db->preparation('INSERT INTO users ( user_email,university_id, user_name, user_password, user_activation_key, user_status)
                                                  VALUES ( :user_email,:university_id ,:user_name, :user_password,:user_activation_key ,:user_status)');
        $oStmt->execute($aData);
        return $this->db->lastInsertId();

    }

    // find user by ID
    public function Login(array $aData)
    {
        $oStmt = $this->db->preparation('SELECT * FROM users WHERE user_name =:username AND user_password =:password ');
        $oStmt->execute($aData);
        return $oStmt->fetch();
    }


    public function roleName($id)
    {
        return $this->db->fetchOne("select role_name , user_role_id from roles  INNER JOIN user_role ON roles.role_id = user_role.role_id WHERE user_id =$id");

    }


    public function activeUser(array $aData)
    {
        $oStmt = $this->db->preparation('update  users set user_status =1 where user_email=:email  and user_activation_key=:code');
        return $oStmt->execute($aData);

    }


    public function activeByAdmin(array $aData)
    {
//        return var_dump($aData);
        $oStmt = $this->db->preparation('update  users set user_status =:user_status where user_id=:user_id');
        return $oStmt->execute($aData);

    }


}


?>
