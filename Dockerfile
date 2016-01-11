FROM tianon/qemu
RUN apt-get update && apt-get install -y curl
RUN apt-get install -y unzip

RUN curl -LO https://releases.hashicorp.com/packer/0.8.6/packer_0.8.6_linux_amd64.zip \
    && unzip packer_0.8.6_linux_amd64.zip \
    && mv packer* /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/packer"]
