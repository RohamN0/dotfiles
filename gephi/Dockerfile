FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        xvfb fluxbox x11vnc novnc websockify \
        wget unzip curl ca-certificates \
        xauth x11-xserver-utils x11-xkb-utils && \
    rm -rf /var/lib/apt/lists/*

# Download gephi
WORKDIR /opt
RUN wget -O gephi-0.10.1-linux-x64.tar.gz "https://github.com/gephi/gephi/releases/download/v0.10.1/gephi-0.10.1-linux-x64.tar.gz"

RUN tar -xvzf /opt/gephi-0.10.1-linux-x64.tar.gz

WORKDIR /opt/gephi-0.10.1

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 8081

CMD ["/startup.sh"]
