<?php
//
use admin\adminController;
use site\homeController;

/*class Helper has functions that use every times*/
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
        return false;
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
    public static function buy($id)
    {

         echo ($id);
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
        return "كورسات";

    }

    public static function siteUrl()
    {
        return "http://uni-be.net";
    }

    public static function siteEmail()
    {
        return "elarning@gmail.com";
    }

    public static function getVideoName($name)
    {
     return   explode( '.',explode('______',$name )[1] )[0];
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
        Session::set('oldFormData', $_REQUEST);
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

    public static function backToRegister($message, $status, $type = 'student')
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
//        echo isset($_REQUEST[$key]) ? $_REQUEST[$key] : '';
        if (Session::has('oldFormData'))
        {
            if (isset($_SESSION['oldFormData'][$key] ) and is_array($_SESSION['oldFormData'][$key]))
                return $_SESSION['oldFormData'][$key];
            else
//                echo $_SESSION['oldFormData'][$key];
            echo isset($_SESSION['oldFormData'][$key]) ?$_SESSION['oldFormData'][$key] : '';
        }

        else
            echo '';

    }

    public static function getVideoDeatils($url)
    {
        include_once(CORE . DIRECTORY_SEPARATOR . 'getid3' . DIRECTORY_SEPARATOR . 'getid3.php');
        $getID3 = new getID3;
        $file = $getID3->analyze($url);
        return ($file);

//        echo("Duration: " . $file['playtime_string'] .
//                            " / Dimensions: " . $file['video']['resolution_x'] . " wide by " . $file['video']['resolution_y'] . " tall" .
//                            " / Filesize: " . $file['filesize'] . " bytes<br />");
    }


    public static function getVideoDuartion($url)
    {
        include_once(CORE . DIRECTORY_SEPARATOR . 'getid3' . DIRECTORY_SEPARATOR . 'getid3.php');
        $getID3 = new getID3;
        $file = $getID3->analyze($url);
        return ($file['playtime_string']);


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

//        if($ids=='')

        $ids = json_decode($ids);
//        return var_dump()$ids;
        $t = '(';
        foreach ($ids as $k => $id) {
            if ($type == 'Category') {
                $cat_name = DB::init()->query("SELECT *  FROM categories WHERE category_id = $id ");
//                return var_dump($cat_name['category_name']);
                if ($cat_name)
                    $t .= $cat_name['category_name'];
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
//        if(explode())

        $cat_name = DB::init()->query("SELECT *  FROM categories WHERE category_id = $id ");
        if (!empty($cat_name)) {
            return $cat_name[0]['category_name'];
        }

    }


}


?>
