#! /bin/bash

# Execute inside a docker container
java -jar /home/${USER}/${PROJECTNAME}/*.war --spring.profiles.active=${PROFILENAME}

echo -e "test"

exit 0
