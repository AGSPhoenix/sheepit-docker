#!/bin/bash

wget https://www.sheepit-renderfarm.com/media/applet/client-latest.php -O /sheep/sheepit.jar
java -jar /sheep/sheepit.jar -ui text -login $user_name -password $user_password -cores $cpu -cache-dir /sheep/cache
