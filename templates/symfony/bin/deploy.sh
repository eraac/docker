#!/bin/sh

dirname="$(dirname "$0")/.."

# == CONFIG ==
project_name="xxx"
fileenv="${dirname}/current_env"
# ====

cd ${dirname}

function current_env() {
    echo `cat ${fileenv}`
}

function next_env() {
    if [ ${1} = "green" ]; then
        echo "blue"
    else
        echo "green"
    fi
}

function write_env() {
    echo ${1} > $fileenv 
}

docker-compose pull code
cenv=$(current_env)
nenv=$(next_env ${cenv})
write_env ${nenv}

docker-compose --project-name ${project_name}_${nenv} up -d 
docker-compose --project-name ${project_name}_${cenv} down

