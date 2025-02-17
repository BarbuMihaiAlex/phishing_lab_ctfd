# Imagine de bază
FROM ubuntu:latest

# Instalăm Docker și Docker Compose în container
RUN apt-get update && apt-get install -y \
    docker.io \
    docker-compose \
    tini \
    && rm -rf /var/lib/apt/lists/*

# Setăm directorul de lucru și copiem fișierele
WORKDIR /lab
COPY docker-compose.yml .
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Folosim Tini ca init system pentru a evita procese zombie
ENTRYPOINT ["/usr/bin/tini", "--"]

# Pornim laboratorul prin script
CMD ["/entrypoint.sh"]
