<?php
define('ROOT', dirname(__DIR__).DIRECTORY_SEPARATOR);
define('APP', ROOT.'app'.DIRECTORY_SEPARATOR);
define('VIEW', ROOT.'app'.DIRECTORY_SEPARATOR.'view'.DIRECTORY_SEPARATOR);
define('MODEL', ROOT.'app'.DIRECTORY_SEPARATOR.'model'.DIRECTORY_SEPARATOR);
define('DATA', ROOT.'app'.DIRECTORY_SEPARATOR.'data'.DIRECTORY_SEPARATOR);
define('CORE', ROOT.'app'.DIRECTORY_SEPARATOR.'core'.DIRECTORY_SEPARATOR);
define('CONTROLLER', ROOT.'app'.DIRECTORY_SEPARATOR.'controller'.DIRECTORY_SEPARATOR);
$modules=[APP,VIEW,MODEL,DATA,CORE,CONTROLLER];
set_include_path(get_include_path().PATH_SEPARATOR.implode(PATH_SEPARATOR,$modules));
// var_dump(get_include_path());
spl_autoload_register('spl_autoload',false);
echo "<pre>";
 var_dump(set_include_path(implode(PATH_SEPARATOR,$modules)));
echo "<pre>";

// echo ROOT;








?>
