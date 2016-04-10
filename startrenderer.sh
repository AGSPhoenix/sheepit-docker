#!/bin/bash

#Check for updates
echo Checking for client updates...
latestVersion=`curl --silent --head https://www.sheepit-renderfarm.com/media/applet/client-latest.php|grep -Po 'Content-Disposition:.*filename="?\Ksheepit-client-[\d\.]+'`

if [ ! -e $latestVersion.jar ]
    then
    echo Updating client...
    rm -f sheepit-client*.jar
    #Download new client. Can't just use curl -OJ due to malformed Content-Disposition header supplied by client-latest.php
    curl https://www.sheepit-renderfarm.com/media/applet/client-latest.php > $latestVersion.jar
fi

#Autodetect cores
if [ $cpu -eq 0 ]
    then
    cpu=`nproc`
fi

echo Starting client.
java -jar /sheep/$latestVersion.jar -ui text -login $user_name -password $user_password -cores $cpu -cache-dir /sheep/cache
