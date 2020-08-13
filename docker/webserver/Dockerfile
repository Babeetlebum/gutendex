FROM python:3.8.5-alpine3.12

WORKDIR /usr/src/app

# install psycopg2 dependencies
# install rsync (required by updatecatalog)
RUN apk add --no-cache postgresql-libs rsync && \
    apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev

RUN pip install --no-cache-dir gunicorn

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN apk --purge del .build-deps

COPY docker/webserver/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
COPY docker/webserver/wait-for-postgres.sh /usr/local/bin
RUN chmod +x /usr/local/bin/wait-for-postgres.sh

COPY . .
COPY docker/.env /usr/src/app/gutendex/.env

SHELL ["/bin/bash", "-c"]

CMD [ "wait-for-postgres.sh", "db", "entrypoint.sh" ]
