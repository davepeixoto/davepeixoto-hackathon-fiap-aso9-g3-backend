# Use uma Imagem Official do Python
FROM python:rc-slim

# Definindo o diretório onde a aplicação será armazenada
WORKDIR /app

# Copiar os arquivos da pasta local para dentro do container
COPY . /app

# Instalar as dependências de Python de acordo com o que foi desenvolvido na aplicação e que está declarado no arquivo requirements.txt.
RUN pip install --trusted-host pypi.python.org -r requirements.txt

ARG INTERNAL_PORT=8080

ENV CLOUD_SQL_USERNAME=playuser
ENV CLOUD_SQL_PASSWORD=123456
ENV CLOUD_SQL_DATABASE_NAME=playlist
ENV DB_LOCAL_HOST=db
ENV CLOUD_SQL_CONNECTION_NAME=
ENV PORT=$INTERNAL_PORT

EXPOSE $INTERNAL_PORT

# Garante que será iniciado a aplicação.
CMD ["gunicorn", "app:app"]