#!/bin/bash

# https://docs.docker.com/config/containers/multi-service_container/

huey_consumer.py worker.huey -k thread -w 2 -q & #CHANGEME change the number of workers if you'd like
gunicorn --workers 2 --bind 0.0.0.0:5000 app:app & #CHANGEME change the number of workers if you'd like

wait -n

exit $?