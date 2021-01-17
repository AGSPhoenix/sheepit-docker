#!/bin/bash

#Check for updates
echo Checking for client updates...
latestVersion=`curl --silent --head https://www.sheepit-renderfarm.com/media/applet/client-latest.php|grep -Po 'content-disposition:.*filename="?\Ksheepit-client-[\d\.]+'`

if [ ! -e $latestVersion.jar ]; then
    echo Updating client...
    rm -f sheepit-client*.jar
    #Download new client.
    curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php -o $latestVersion.jar
fi

#Autodetect cores
if [ $cpu -eq 0 ]; then
    echo No core count specified, autodetected `nproc` cores.
    cpu=`nproc`
fi

echo Starting client.
java -jar /sheep/$latestVersion.jar -ui text -login $user_name -password $user_password -cores $cpu -cache-dir /sheep/cache
