<?php

$output = shell_exec('irsend SEND_ONCE window KEY_OPEN');
echo "OPEN</br>";
echo "<pre>$output</pre>";
?>

