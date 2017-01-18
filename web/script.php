<pre><?php
    $shell_commands = '
        /app/web/script.bash
    ';
    $shell_output = shell_exec($shell_commands);
    echo $shell_output;
?></pre>
