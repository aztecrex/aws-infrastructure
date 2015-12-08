FROM progrium/busybox


RUN opkg-install curl bash git


COPY functions.sh /
COPY task.sh /

RUN ["chmod","+x","task.sh"]

ENTRYPOINT ["/task.sh"]

CMD ["5555555555", "default container message"]

