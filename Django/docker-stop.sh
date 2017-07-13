#!/bin/bash

container_name="fzl_django_$1";
docker stop $container_name
