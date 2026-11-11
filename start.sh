#!/bin/sh
# Sobe o MariaDB com o ddl.sql e o dml.sql e abre o DbGate no navegador.
set -e
cd "$(dirname "$0")"

URL=http://localhost:8080

docker compose up -d --wait db client

until curl -fs -o /dev/null "$URL"; do sleep 1; done

echo "Banco MadeiraVerde pronto. Cliente MariaDB em $URL"
if command -v xdg-open >/dev/null; then xdg-open "$URL" >/dev/null 2>&1
elif command -v open >/dev/null; then open "$URL"
fi
echo "Para encerrar: docker compose down"
