FROM alpine:latest

RUN \
	mkdir -p /aws && \
	apk -Uuv add bash groff less python py-pip curl && \
	pip install awscli && \
  apk --purge -v del py-pip && \
  rm /var/cache/apk/*

COPY twilio.config.encrypted /
COPY functions.sh /
COPY task.sh /
RUN chmod +x task.sh

ENTRYPOINT ["/task.sh"]
