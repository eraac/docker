FROM python:2-alpine

USER root

RUN mkdir /root/logs

COPY tipboard /root/clipboard

RUN sh -c "cd /root/clipboard && pip install ."

EXPOSE 7272

VOLUME /root/.tipboard

CMD ["tipboard", "runserver", "0.0.0.0", "7272"]

