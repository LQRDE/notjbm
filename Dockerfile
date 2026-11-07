FROM alpine:latest

RUN apk add --no-cache curl bash supervisor nginx

# Устанавливаем xray (ядро для работы VLESS)
RUN bash -c "$(curl -Ls https://github.com)"

# Скачиваем и ставим саму панель 3X-UI
RUN bash -c "$(curl -Ls https://githubusercontent.com)"

# Настраиваем порт панели под Render (10000)
RUN /usr/local/x-ui/x-ui setting -username admin -password super_secure_password_123 -port 10000

CMD ["/usr/local/x-ui/x-ui", "start"]
