FROM alpine:3.19

# تثبيت الأدوات
RUN apk add --no-cache curl unzip

# تحميل Xray
RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/xray \
    && rm -rf /tmp/xray.zip

# نسخ ملف الإعداد
COPY config.json /etc/xray/config.json

# Cloud Run يستخدم PORT تلقائياً
ENV PORT=8080

EXPOSE 8080

CMD ["/usr/local/bin/xray", "-config", "/etc/xray/config.json"]
