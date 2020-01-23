<?php

/**
 *
 */
abstract class Message

{
    function __construct()
    {

    }

    /**
     * @param $msg
     * @return null
     */

    public static function getMessage($msg)
    {
        if (Session::has($msg)) {
            $message = Session::get($msg);
            if ($msg != 'msgState') {
                Session::delete($msg);
            }
            return $message;
        } else {
            return '';
        }

    }

    public static function getInputErrorMessage($input)
    {
        $all = '';
        $m = '';
        if (Session::has('errors')) {
            $all = Session::get('errors')['value'];
            if (isset($all[$input])) {
                $m = '<span class="btn-block badge badge-danger">';
                foreach ($all[$input] as $error)
                    $m .= $error . '<br>';
                $m .= '</span>';

            }
        }
        return $m;
    }


    /**
     * @param $key
     * @param $msg
     */
    public static function setMessage($key, $msg, $type)
    {
        Session::set($key, array('value' => $msg, 'type' => $type));
    }

    /**
     * @param $key
     * @return $view
     */
}


?>
