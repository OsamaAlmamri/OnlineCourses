<?php
/**
 *
 */

class Profile
{
    protected $data_file;
    protected $db;
    protected $inventory = [];

    function __construct()
    {
        $this->db = new Model();
    }
    public function ProfileUser($id)
    {

        return $this->db->query("select * from profiles INNER JOIN users ON profiles.user_id = users.user_id where users.`user_id`=$id");

    }
    public function UpdateData(array $args)
    {

        $data = $this->db->preparation('update profiles  inner join  users on profiles.user_id = users.user_id
                                 set user_full_name=:full,user_image=:image,document=:document,user_phone=:phone,user_email=:email,user_name=:user_name,user_password=:pass 
                                WHERE users.`user_id`=:id');

        return   $data->execute($args);
    }

//add new row to users table
    public function add(array $aData)
    {
        // ':user_id' => $id,
        //            ':user_full_name' => htmlentities($this->user_full_name),
        //            ':user_phone' => htmlentities($this->user_phone),
        //            ':user_gender' => htmlentities($this->user_gender),
        //            ':user_image' => $logo,
        //            ':document' => $document,
        //            ':user_qualification' => htmlentities($this->user_qualification),
        //            ':user_register_date' => date("D- y/m/j  h-i-s ")

        $oStmt = $this->db->preparation('INSERT INTO profiles ( user_id, user_full_name, user_phone, user_gender, user_image, document, user_qualification, user_register_date)
                                                  VALUES ( :user_id, :user_full_name, :user_phone,:user_gender ,:user_image, :document,:user_qualification ,:user_register_date)');
        return  $oStmt->execute($aData);
//        return $this->db->lastInsertId();

    }


}


?>
