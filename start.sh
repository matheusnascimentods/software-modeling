#!/bin/sh
# Sobe o MariaDB com o ddl.sql e o dml.sql e abre o DbGate no navegador.
# Se o ambiente já estiver de pé, derruba antes para recriar o banco do zero.
set -e
cd "$(dirname "$0")"

URL=http://localhost:8080

if [ -n "$(docker compose ps -aq)" ]; then
  echo "Derrubando o ambiente anterior..."
  # Com o Docker instalado via snap, o AppArmor impede o daemon de parar os
  # containers; nesse caso, encerra os processos como root e tenta de novo.
  docker compose down -t 0 2>/dev/null || {
    sudo kill -9 $(docker inspect -f '{{.State.Pid}}' $(docker compose ps -q))
    docker compose down -t 0
  }
fi

docker compose up -d --wait db client

until curl -fs -o /dev/null "$URL"; do sleep 1; done

echo "Banco MadeiraVerde pronto. Cliente MariaDB em $URL"
if command -v xdg-open >/dev/null; then xdg-open "$URL" >/dev/null 2>&1
elif command -v open >/dev/null; then open "$URL"
fi
echo "Para encerrar: docker compose down (ou rode ./start.sh de novo para recriar o banco)"
