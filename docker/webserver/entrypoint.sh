#!/bin/sh
python ./manage.py migrate
python ./manage.py updatecatalog
python ./manage.py collectstatic --noinput
gunicorn -b 0.0.0.0 gutendex.wsgi
