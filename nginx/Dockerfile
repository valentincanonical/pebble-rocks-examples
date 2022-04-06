FROM pebble:latest AS pebble

FROM ubuntu/nginx
# copy/install Pebble binary
COPY --chown=root:root --from=pebble /usr/bin/pebble /usr/bin/pebble
# copy Pebble layers
COPY --chown=root:root ./layers/ /var/lib/pebble/default/layers/
# copy scripts
COPY --chown=1000:1000 ./scripts/ /var/lib/scripts/
# copy NGINX templates
RUN rm /etc/nginx/sites-available/* && rm /etc/nginx/sites-enabled/*
COPY --chown=1000:1000 ./templates/ /etc/nginx/templates/

ENTRYPOINT [ "/usr/bin/pebble" ]
CMD [ "run" ]
