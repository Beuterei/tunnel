FROM nginx:1.12-alpine

RUN apk add --no-cache openssh \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config

RUN passwd -d root

RUN ssh-keygen -A

COPY .htpasswd /etc/nginx/.htpasswd
COPY identity.pub /root/.ssh/authorized_keys

COPY nginx.conf /etc/nginx/nginx.conf

COPY entrypoint.sh ./
RUN chmod +x entrypoint.sh

EXPOSE 80 22

ENTRYPOINT [ "/entrypoint.sh" ]