<?php

$output = shell_exec('irsend SEND_ONCE sunp KEY_STOP');
echo "stop</br>";
echo "<pre>$output</pre>";
?>


