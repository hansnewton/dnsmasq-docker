# 1. Docker e docker-compose

- **Mude para o diretorio deste repositorio:**

`cd dnsmasq-docker/`

- **Iniciar o container**

`docker-compose up -d`

- **Parar o container**

`docker-compose down`

- **Recompilar o Dockerfile**

`docker-compose up --build`

## Test script (precisa do utilitário `dig` instalado no host)

- **Conceda permissão de escrita para o arquivo teste-script.sh**

`chmod u+x test-script.sh`

- **Com o container do dnsmasq rodando, execute o arquivo**

`./test-script.sh`

## Deseja incluir outros hostnames/IPs/Entradas DNS ?

Alterar arquivo `hostnames.txt` com as informações

## Deseja que o DNSMASQ-DOCKER seja seu resolvedor de DNS padrao?

Alterar o arquivo /etc/resolv.conf e incluir o registro a seguir no início sem `#`:

`nameserver 127.0.0.1`

# 2. Ambiente de máquina virtual

- dns server : Debian 10 (buster)
- host client: Linux, Mac

## 2.1 comandos

- **Instale vagrant e virtualbox e use o seguinte comando para subir uma vm on the fly**

`vagrant up`

- **Entre na máquina virtual**

`vagrant ssh`

### Obs.: os dois comandos acima sao opcionais, se nao usar vagrant utilize na sua plataforma. o objetivo até aqui é ter uma VM em funcionamento para os passos seguintes.

- **Atualizar depedencias da VM**

`apt-get update`

- **Instalar depedencias**

`apt-get install -y dnsmasq dnsutils`

- **Configurar dnsmasq.conf**

`echo -e "\n\n# Projeto redes configs.." >> /etc/dnsmasq.conf;`

`echo "log-queries" >> /etc/dnsmasq.conf;`

`echo "conf-dir=/etc/dnsmasq.d/,*.conf" >> /etc/dnsmasq.conf;`


- **Configuracoes adicionais**
    
```bash
cat <<EOF > /etc/dnsmasq.d/redes.net 
no-dhcp-interface=enp0s3
bogus-priv
domain=redes.lan
expand-hosts
#no-hosts
#addn-hosts=/etc/hostnames.txt
local=/redes.lan/
domain-needed
no-resolv
no-poll
server=8.8.8.8
server=8.8.4.4
EOF
```

- **Configurar /etc/hosts**

Adicionar a linha abaixo ao arquivo /etc/hosts

`192.168.1.156 www.google.com google`

- **Reinicar dnsmasq**

`systemctl restart dnsmasq`

## 3 Cenários

1 - instalando na propria maquina (até aqui ok)

2 - usando vms ou containers:
será necessario configurar o arquivo /etc/resolv.conf no linux
rede do container provavelmente deve estar em modo-bridge

3 - acessar servicos por nome


# 4. Compilar manualmente

## Comandos executados no ambiente local

`git clone git://thekelleys.org.uk/dnsmasq.git`

- dnsmasq/doc.html -> contem informacoes basicas

- dnsmasq/setup.html -> ensina a instalar

### Executando orientacoes de setup.html

Comandos executados em ambiente GNU/Linux.

`cd dnsmasq/`

`sudo make install`

Até aqui o binario foi instalado na /usr/local/sbin/dnsmasq

Criar link simbolico:

`ln -s /usr/local/sbin/dnsmasq /usr/local/bin/dnsmasq`

Configurar arquivo dnsmasq.conf

`cp dnsmasq.conf.example dnsmasq.conf`

copiar para /etc/dnsmasq.conf

modificar /etc/resolv.conf

criar arquivo hosts.txt e copiar no /etc/hosts

configurar para ser apenas local

configurar para ir na internet
