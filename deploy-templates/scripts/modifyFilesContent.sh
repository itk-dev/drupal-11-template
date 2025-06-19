#!/bin/bash

file=".env"
echo "COMPOSE_PROJECT_NAME=$PROJECTNAME" > $file
echo "COMPOSE_DOMAIN=$PROJECTNAME.local.itkdev.dk" >> $file
cat $file

file="./deploy-templates/settings.local.php"
echo "" >> $file
echo "/**" >> $file
echo " * Set trusted host pattern." >> $file
echo " */" >> $file
echo "\$settings['trusted_host_patterns'][] = '^$PROJECTNAME\.local\.itkdev\.dk$';" >> $file
cat $file
