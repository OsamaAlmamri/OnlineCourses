<?php
/**
 *
 */

//class to
abstract class User
{
    protected $user_id;
    protected $user_name;
    protected $user_email;
    protected $user_password;
    protected $user_activation_key;
    protected $user_status;


    function __construct($userData)
    {
        $this->user_email = $userData["user_email"];
        $this->user_name = $userData["code"];
        $this->user_password = $userData["user_password"];
        $this->user_activation_key = $userData["user_activation_key"];
        $this->user_status = $userData["user_status"];
    }


}


?>
