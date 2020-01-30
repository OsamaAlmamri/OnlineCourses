<?php

use admin\adminController;
use site\homeController;

/**
 *
 */
class Helper
{


//    public static function getMainMenu($type)
//    {
//        if ($type == 'main') {
//            $c = DB::init()->query("SELECT *  FROM categories2 WHERE parent =0 and isMain=1 order by sort");
//
//
//        } else
//            $c = DB::init()->query("SELECT *  FROM categories2 WHERE parent =0 and isMain=0 order by sort ");
////            $c = Category::all()->where('parent', '')->where('isMain', 0)->sortBy('sort');
//        return ($c);
//    }

//    public static function getCategories()
//    {
//
//        $c = DB::init()->query("SELECT *  FROM categories2 order by sort ");
//        return ($c);
//    }

//    public static function countChild($id)
//    {
//        $counter = DB::init()->query("SELECT COUNT(*) AS count FROM categories2 WHERE parent= $id ");
//
//        return $counter[0]['count'];
//
//    }
//
    public static function uniqueFild($data)
    {

        $like = $data['input'] . " like '%" . $data['data'] . "%' ";
        $counter = DB::init()->query("SELECT COUNT(*)  As count FROM " . $data['table'] . " WHERE user_id <>" . $data['id'] . " and " . $like);
        return ($counter[0]['count']) > 0 ? true : false;
        return  false;
    }
//
//    public static function returnChild($id)
//    {
//        $c = DB::init()->query("SELECT * FROM categories2 WHERE parent = $id order by sort");
//        return ($c);
////        $c = Category::all()->where('parent', $id)->sortBy('sort');
//
//    }

    public static function userName($id)
    {

        $username = DB::init()->query("SELECT * FROM users WHERE id = $id ");
        if (!empty($username)) {
            return $username[0]['username'];
        }

    }

    public static function isAdmin()
    {
        if (isset($_SESSION['role_name']) and ($_SESSION['role_name'] == 'admin' or $_SESSION['role_name'] == 'university'))
            return true;
        else
            return false;

    }

    public static function viewAdminFile()
    {
        if (Helper::isAdmin())
            return true;

        $h = new homeController;
        $h->index();

    }

    public static function siteName()
    {
        return "StepForword";

    }

    public static function siteUrl()
    {
        return "http://uni-be.net";

    }

    public static function siteEmail()
    {
        return "elarning@gmail.com";

    }


    public static function backToHome($message, $status)
    {
        $homeController = new homeController();
        Message::setMessage('main', $message, $status);
        $homeController->index();
        return;
    }


    public static function back($url, $message, $status)
    {
        Message::setMessage('main', $message, $status);
        header("Location: " . $url);

        return;
    }

    public static function backToLogin($message, $status)
    {
        $homeController = new homeController();
        Message::setMessage('main', $message, $status);
        $homeController->login();
        return;
    }

    public static function backToRegister($message, $status,$type='student')
    {
        $homeController = new homeController();
        Message::setMessage('main', $message, $status);
        $homeController->register($type);
        return;
    }


    public static function backToDashboard($message, $status)
    {
        $adminController = new adminController();
        Message::setMessage('main', $message, $status);
        $adminController->index();
        return;
    }

    public static function old($key)
    {
        echo isset($_REQUEST[$key]) ? $_REQUEST[$key] : '';
    }


    public static function errors($key)
    {
        $errors = Message::getMessage('errors');
//        return $errors

        echo isset($_REQUEST[$key]) ? $_REQUEST[$key] : '';
    }

//    public final $allErrors;


    public static function Names($ids, $type)
    {
        $ids = json_decode($ids);
        $t = '(';
        foreach ($ids as $k => $id) {
            if ($type == 'Category') {
                $cat_name = DB::init()->query("SELECT *  FROM categories WHERE id = $id ");
                if ($cat_name)
                    $t .= $cat_name[0]['name'];
            }
            if ($k < count($ids) - 1 and $k % 2 == 1)
                $t .= ' <br> ';
            if ($k < count($ids) - 1 and $k % 2 == 0)
                $t .= ' , ';

        }
        $t .= ')';
        return $t;

    }


    public static function saveImage($file, $folder)
    {
        $time = time();
        $logo = $_FILES[$file] ['name'];
        $f_type = $_FILES[$file] ['type'];
        $file_tmp = $_FILES[$file] ['tmp_name'];
        $types = array('image/jpeg', 'image/gif', 'image/png');
        if ($logo != "") {
            if (in_array($f_type, $types)) {
                if (move_uploaded_file($file_tmp, $folder . $time . $logo))
                    $logo = '/' . $folder . $time . $logo;
                return $logo;
            }
        }
        return '/' . $folder . 'default.png';
    }

    public static function getCategoryName($id)
    {

        $cat_name = DB::init()->query("SELECT *  FROM categories WHERE category_id = $id ");
        if (!empty($cat_name)) {
            return $cat_name[0]['category_name'];
        }

    }



}


?>
