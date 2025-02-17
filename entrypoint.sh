#!/bin/bash

# Funcție pentru oprirea laboratoarelor
cleanup() {
    echo "Oprire laboratoare..."
    docker-compose down
    exit 0
}

# Prindem semnalele de terminare pentru a închide containerele corect
trap cleanup SIGINT SIGTERM

# Pornim containerele laboratorului
echo "Pornire laborator..."
service docker start
docker-compose up &

# Așteptăm procesul pentru a menține containerul activ
wait
