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
    public function all()
    {
        return $this->db->query("select * from users");
    }

//add new row to users table
    public function add(array $aData)
    {
//return var_dump($aData);   ':user_email' => htmlentities($this->email),
//                    ':user_name' => htmlentities($this->user_name),
//                    ':user_password' => \Hashing::init($this->password),
//                    ':user_activation_key' => $this->generateCode(),
//                    ':user_status' => $status,
        $oStmt = $this->db->preparation('INSERT INTO users ( user_email, user_name, user_password, user_activation_key, user_status)
                                                  VALUES ( :user_email, :user_name, :user_password,:user_activation_key ,:user_status)');
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


}


?>
