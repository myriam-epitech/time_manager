#!/bin/bash

while ! pg_isready -q -h $POSTGRES_HOSTNAME -p $POSTGRES_PORT -U $POSTGRES_USERNAME
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

if [[ -z `psql -Atqc "\\list $POSTGRES_PASSWORD"` ]]; then
  echo "Database $POSTGRES_PASSWORD does not exist. Creating..."
#   createdb -E UTF8 $POSTGRES_PASSWORD -l en_US.UTF-8 -T template0
  mix ecto.create
  mix ecto.migrate
  echo "Database $POSTGRES_PASSWORD created."
fi

exec mix phx.server