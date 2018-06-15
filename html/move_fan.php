<?php

$output = shell_exec('irsend SEND_ONCE sunp KEY_MOVE');
echo "move</br>";
echo "<pre>$output</pre>";
?>

