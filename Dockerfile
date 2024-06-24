FROM alpine:latest
RUN apk add tcpdump
ENTRYPOINT ["/bin/sh"]
