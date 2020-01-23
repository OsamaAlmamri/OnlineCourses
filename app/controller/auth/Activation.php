<?php


namespace auth;


use Controller;

class Activation extends Controller
{

    private $email;
    private $code;

    function __construct($userData)
    {
        $this->email = $userData["u_email"];
        $this->code = $userData["code"];
    }

    function activeUser()
    {

        $this->model('Users');
        $active_data = array(
            'email' => $this->email,
            'code' => $this->code);
        $user = $this->model->activeUser($active_data);
        if ($user > 0) {
            $this->sendEmail();
            \Helper::backToLogin('welcome you can now login ', 'success');
        } else
            \Helper::backToHome('activation code is wrong', 'warning');

    }

    function sendEmail()
    {
        $headers = '';
        $from = \Helper::siteEmail();
        $headers .= 'From: ' . $from . "\r\n" .
            'Reply-To: ' . $from . "\r\n" .
            'X-Mailer: PHP/' . phpversion();

        $msg = "<body>
                    thank you for register in " . \Helper::siteName() . " site you can now learn in our site 
                </body>";
        mail($this->email, " welecom in" . \Helper::siteName(), $msg, $headers);

    }

}