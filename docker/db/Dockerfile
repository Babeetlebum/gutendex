FROM postgres:12.3-alpine

COPY ./docker/db/entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh

RUN mkdir -p /home/postgres
RUN chown -R 70:70 /home/postgres

USER postgres

# CMD [ "entrypoint.sh" ]
