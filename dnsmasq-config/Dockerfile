# dizer a imagem de origem
FROM debian:10

# autores
LABEL authors="Hans, Victor"

# diretorio de trabalho
WORKDIR /app

# copia arquivos utilizados
COPY ./start.sh /app

COPY ./hostnames.txt /app

# permissao de escrita
RUN chmod u+x start.sh

# atualizar repositorio apt
RUN apt-get update

# instalar depedencias
RUN apt-get install -y vim net-tools dnsmasq dnsutils iputils-ping

# configurar dnsmasq parte 1
RUN echo "" >> /etc/dnsmasq.conf; \
    echo "" >> /etc/dnsmasq.conf; \
    echo "#configs.." >> /etc/dnsmasq.conf; \
    echo "log-queries" >> /etc/dnsmasq.conf; \
    echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf; \
    echo "log-facility=/tmp/dnsmasq.log" >> /etc/dnsmasq.conf;

# configurar dnsmasq parte 2
RUN echo 'no-dhcp-interface=eth0\n\
bogus-priv\n\
domain=redes.lan\n\
expand-hosts\n\
#no-hosts\n\
addn-hosts=/app/hostnames.txt\n\
local=/redes.lan/\n\
domain-needed\n\
no-resolv\n\
no-poll\n\
server=192.168.15.1\n\
server=8.8.8.8\n\
server=8.8.4.4'\ >> /etc/dnsmasq.d/redes.net 

# informar portas que serao expostas
EXPOSE 53/tcp
EXPOSE 53/udp

# finalizar iniciando servico dnsmasq
ENTRYPOINT ./start.sh