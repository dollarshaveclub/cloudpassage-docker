FROM phusion/baseimage:latest

RUN echo 'deb http://packages.cloudpassage.com/debian debian main' | tee /etc/apt/sources.list.d/cloudpassage.list > /dev/null && \
    curl http://packages.cloudpassage.com/cloudpassage.packages.key | apt-key add - && \
    apt-get update && apt-get -y install cphalo && \
    apt-get clean --quiet && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/opt/cloudpassage/bin/cphalo", "--daemon-key=${CLOUDPASSAGE_KEY}", "--tag=${CLOUDPASSAGE_TAG}"]
