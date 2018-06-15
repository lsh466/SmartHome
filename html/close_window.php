<?php

$output = shell_exec('irsend SEND_ONCE window KEY_CLOSE');
echo "close</br>";
echo "<pre>$output</pre>";
?>

