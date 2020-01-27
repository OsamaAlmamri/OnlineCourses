<?php
/**
 *
 */

//class to
class Application
{
    protected $controller = 'homeController';
    protected $action = 'index';
    protected $namespace = 'site';
    protected $params = [];

    public function __construct()
    {
        session_start();
        // echo $_SERVER['REQUEST_URI'];
// echo $this->controller,"<br>",$this->action,"<br>",print_r($this->params);

        $this->prepareURL();

        if (file_exists(CONTROLLER . DIRECTORY_SEPARATOR . $this->namespace . DIRECTORY_SEPARATOR . $this->controller . '.php')) {

//            $this->controller = new $this->controller;
            $f = DIRECTORY_SEPARATOR . $this->namespace . DIRECTORY_SEPARATOR . $this->controller;
            $this->controller = new $f;
            if (method_exists($this->controller, $this->action)) {

                call_user_func_array([$this->controller, $this->action], $this->params);
            } else {
                call_user_func_array([$this->controller, 'index'], $this->params);
            }
        } else {
            $this->controller = new \site\homeController;
            call_user_func_array([$this->controller, 'index'], $this->params);
        }
    }

    #process of prepare url and take controller , action and another parameters and assign thim
    protected function prepareURL()
    {

        $request = trim($_SERVER['REQUEST_URI'], '/');
        if (!empty($request)) {
            $url = explode('/', $request);
            $this->namespace = (isset($url[0]) and ($url[0] == 'admin' or $url[0] == 'teacher' or $url[0] == 'university' )) ? $url[0] : 'site';
            if ($this->namespace == 'site') {
                $this->controller = isset($url[0]) ? $url[0] . 'Controller' : 'homeController';
                $this->action = isset($url[1]) ? $url[1] : 'index';
                unset($url[0], $url[1]);
            } else {
                if (isset($url[1]) and ($url[1] == 'login' or $url[1] == 'logout' or $url[1] == 'register' or $url[1] == 'singUp' or $url[1] == 'index')) {



                    $this->controller = isset($url[0]) ? $url[0] . 'Controller' : 'adminController';
                    $this->action = $url[1];
                    return ;
                }
                $this->controller = isset($url[1]) ? $url[1] . 'Controller' : 'adminController';
                $this->action = isset($url[2]) ? $url[2] : 'index';
                unset($url[0], $url[1], $url[2]);
            }

            $this->params = !empty($url) ? array_values($url) : [];
        }

    }
}


?>
