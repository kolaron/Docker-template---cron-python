FROM python:3.8.5

RUN apt-get update && apt-get -y install cron

WORKDIR /opt/platform-location
COPY task.py /opt/platform-location/task.py

RUN echo "* * * * * root python3 /opt/platform-location/task.py >> /var/log/cron.log 2>&1" >> /etc/cron.d/cronpy
RUN chmod 0644 /etc/cron.d/cronpy
RUN touch /var/log/cron.log
CMD cron && tail -f /var/log/cron.log