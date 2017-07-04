<?php
/**
 * @link http://www.lrdouble.com/
 * @copyright Copyright (c) 2017 Double Software LLC
 * @license http://www.lrdouble.com/license/
 */
function digui($n=1)
{
    if($n<1000)
    {
        echo $n.'<br/>';
        $n++;
        return digui($n);
    }
    return false;
}
digui();
//phpinfo();
