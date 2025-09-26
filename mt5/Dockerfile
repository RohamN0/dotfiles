FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:1
ENV WINEPREFIX=/root/.wine
ENV WINEARCH=win64

# Enable contrib and non-free repos for Wine
RUN sed -i 's/main/main contrib non-free non-free-firmware/g' /etc/apt/sources.list.d/debian.sources

# Install dependencies
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        wine64 wine32 wine winetricks \
        xvfb fluxbox x11vnc novnc websockify \
        wget unzip curl ca-certificates \
        fonts-wine cabextract xauth x11-xserver-utils x11-xkb-utils && \
    rm -rf /var/lib/apt/lists/*

# Download MT5 installer
WORKDIR /opt
RUN wget -O mt5setup.exe "https://download.mql5.com/cdn/web/metaquotes.software.corp/mt5/mt5setup.exe"

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 8080

CMD ["/startup.sh"]
