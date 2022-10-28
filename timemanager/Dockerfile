FROM elixir:latest

RUN mkdir /app
COPY . /app
WORKDIR /app

EXPOSE 4000
RUN apt-get update
RUN     apt-get install -y postgresql-client
#RUN     apt-get install -y inotify-tools && \
#     apt-get install -y nodejs && \
#     curl -L https://npmjs.org/install.sh | sh
    
RUN mix local.hex --force
RUN mix deps.get
RUN mix compile

CMD ["bash", "./entrypoint.sh"]