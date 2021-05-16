# Comandos executados no ambiente local

`git clone git://thekelleys.org.uk/dnsmasq.git`

- dnsmasq/doc.html -> contem informacoes basicas

- dnsmasq/setup.html -> ensina a instalar

## Executando orientacoes de setup.html

Comandos executados em ambiente Unix.

`cd dnsmasq/`

`sudo make install`

Aqui o binario foi instalado na /usr/local/sbin/dnsmasq

criando link simbolico:

`ln -s /usr/local/sbin/dnsmasq /usr/local/bin/dnsmasq`

configurar arquivos dnsmasq.conf

copiar para /etc/dnsmasq.conf

criar arquivo hosts.txt e copiar no /etc/hosts

configurar para ser apenas local

configurar para ir na internet

criar docker

criar docker-compose