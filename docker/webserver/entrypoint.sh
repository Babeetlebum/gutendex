#!/bin/sh
python ./manage.py migrate
python ./manage.py updatecatalog
python ./manage.py collectstatic
python ./manage.py runserver
