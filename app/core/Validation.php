<?php

/**
 *
 */
class Validation
{

    function __construct()
    {

    }

    public function validate($data)
    {
        $error = [];
        foreach (($data) as $fildName => $typeValidate) {
            $error = array_merge($error, self::checkFild($fildName, $typeValidate));
        }
        Message::setMessage('errors', $error, 'error');
        return $error;
    }


    private function checkFild($fildName, $validation)
    {
        $errors = [];
        foreach ($validation[0] as $typeValidate => $data) {
            $formData = @$_REQUEST[$fildName];
            switch ($typeValidate) {
                case 'required':
                    if (strlen($formData) < 1)
                        $errors[$fildName][$typeValidate] = $fildName . ' is required ';
                    break;
                case 'imageRequired':
                    if (($_FILES[$fildName]['name']) == '')
                        $errors[$fildName][$typeValidate] = $fildName . ' is required ';
                    break;
                case 'min':
                    if (strlen($formData) < $data)
                        $errors[$fildName][$typeValidate] = $fildName . '  must be more than ' . $data;
                    break;
                case 'minWords':
                    if (str_word_count($formData) < $data)
                        $errors[$fildName][$typeValidate] = $fildName . '  must be more than ' . $data . 'words';
                    break;
                case 'max':
                    if (strlen($formData) > $data)
                        $errors[$fildName][$typeValidate] = $fildName . '  must be less than ' . $data;
                    break;
                case 'maxWords':
                    if (str_word_count($formData) > $data)
                        $errors[$fildName][$typeValidate] = $fildName . '  must be less than ' . $data . 'words';
                    break;
                case 'confirmed':
                    if ($_REQUEST[$data] != $formData)
                        $errors[$fildName][$typeValidate] = 'password not equall';
                    break;
                case 'select':
                    if (!isset($_REQUEST[$fildName]))
                        $errors[$fildName][$typeValidate] = 'must be select 1 at less';
                    break;
                case 'unique':
                    if (Helper::uniqueFild(array('table' => $data[0], 'input' => $data[1], 'data' => $_REQUEST[$fildName], 'id' => isset($data[2]) ? $data[2] : '0')))
//                        var_dump(Helper::uniqueFild(array('table' => $data[0], 'input' => $data[1], 'data' => $_REQUEST[$fildName])));
                        $errors[$fildName][$typeValidate] = ' this ' . $fildName . ' is not allowed to used';
                    break;
            }
        }
        return $errors;

    }
}

?>
