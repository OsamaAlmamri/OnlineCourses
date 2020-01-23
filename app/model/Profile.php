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
