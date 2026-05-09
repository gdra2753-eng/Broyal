FROM alpine:latest

RUN apk add --no-cache wget unzip

WORKDIR /app

RUN wget -O xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && chmod +x xray

COPY config.json /app/config.json

EXPOSE 8080

CMD ["./xray", "-config", "config.json"]
