# https://hub.docker.com/_/alpine
FROM alpine:3.22

ENV HOME=/home/duplicity

RUN set -x \
 && apk add --no-cache \
        gnupg \
	duplicity 

RUN set -x \
    # Run as non-root user.
 && adduser -D -u 1896 duplicity \
 && mkdir -p /home/duplicity/.cache/duplicity \
 && mkdir -p /home/duplicity/.gnupg \
 && chmod -R go+rwx /home/duplicity/ \
 && chown -R duplicity:duplicity /home/duplicity \
 && chmod -R 700 /home/duplicity/.gnupg

VOLUME ["/home/duplicity/.cache/duplicity", "/home/duplicity/.gnupg"]

USER duplicity

# Brief check that it works.
RUN duplicity --version

CMD ["duplicity"]
