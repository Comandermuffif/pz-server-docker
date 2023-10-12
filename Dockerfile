FROM steamcmd/steamcmd:ubuntu-22

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        python3-minimal \
        iputils-ping \
        lib32gcc-s1 \
        vim \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY server.sh /root
RUN chmod +x /root/server.sh

ENV \
PZ_SERVER_NAME="default" \
PZ_ADMIN_PASSWORD="changeme"

VOLUME [ "/server", "/zomboid" ]
ENTRYPOINT [ "/bin/bash", "/root/server.sh" ]