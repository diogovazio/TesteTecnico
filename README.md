# Testes Tecnico MaxMilhas

## Instalação do Docker

  * Remover Versões Anteriores do Docker

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```
   * Atualizar o repsirotio

```bash
sudo apt-get update
```

   * Atualizar os pacotes e pemritir a utização de repositorio

```bash
$ sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common
```

   * Adicionar Doeck's official GPG Key

```bash
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
	* Configurar repositorio do Docker

```bash
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
```	
	* Atualizar Pacotes
	
```bash
sudo apt-get update
```	

 * Istalar os pacotes atualizados do Docker
 
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
```	
 
 

** Instalção utilizando documentação oficial https://docs.docker.com/install/linux/docker-ce/ubuntu/**

 
## Instalação do Docker Composer
 
 * Baixar a versão estavel do docker composer

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```
   * Aplicar permição de executavel no binario

```bash
sudo chmod +x /usr/local/bin/docker-compose
```


** Utilizado documentação oficial / https://docs.docker.com/compose/install/ **

 
 ## Instalação da API Docker-viacep-flask
 
  * Clonar o repositorio
	
```bash
git clone https://github.com/leleobhz/docker-viacep-flask.git 
```	 
 
 * Entrar na pasta do projeto
```bash
cd docker-viacep-flask/ 
```	 
 
  * Executar a Aplicação
```bash
sudo ./upgradeImage.sh 

Retorno da aplicação

vazio@cep-api:~/docker-viacep-flask$ ci upgradeImage.sh

Command 'ci' not found, but can be installed with:

sudo apt install rcs

vazio@cep-api:~/docker-viacep-flask$ vi upgradeImage.sh
vazio@cep-api:~/docker-viacep-flask$ vi docker-composer.yml
vazio@cep-api:~/docker-viacep-flask$ vi docker-compose.yml
vazio@cep-api:~/docker-viacep-flask$ sudo  ./upgradeImage.sh
Going to remove viacep, nginx-proxy
Removing viacep      ... done
Removing nginx-proxy ... done
Pulling nginx-proxy ... done
Pulling viacep      ... done
Building viacep
Step 1/10 : FROM python:alpine
 ---> a93594ce93e7
Step 2/10 : LABEL maintainer="Leonardo Amaral <docker@leonardoamaral.com.br>"
 ---> Using cache
 ---> 7fc36530f505
Step 3/10 : RUN apk add --no-cache --virtual .build-deps     git
 ---> Using cache
 ---> 81e5ec7c0456
Step 4/10 : RUN pip install requests
 ---> Using cache
 ---> 27bbdf7fe652
Step 5/10 : RUN pip install git+https://github.com/leogregianin/viacep-python.git
 ---> Using cache
 ---> fc8ebf58bdf5
Step 6/10 : RUN mkdir -p /tmp/build &&     cd /tmp/build &&     git clone https://github.com/leogregianin/viacep-flask.git &&     cd viacep-flask &&     pip install --ignore-installed -r requirements.txt &&     cd /
 ---> Using cache
 ---> a086b377c4be
Step 7/10 : RUN apk del .build-deps
 ---> Using cache
 ---> a7d37c5d20b5
Step 8/10 : EXPOSE 5000
 ---> Using cache
 ---> f3a6a3b0e7bc
Step 9/10 : WORKDIR /tmp/build/viacep-flask
 ---> Using cache
 ---> dc574777ae9e
Step 10/10 : ENTRYPOINT ["python", "-m", "flask", "run", "--host=0.0.0.0"]
 ---> Using cache
 ---> acc8f2a76fea

Successfully built acc8f2a76fea
Successfully tagged docker-viacep-flask_viacep:latest
Creating nginx-proxy ... done
Creating viacep      ... done
Attaching to nginx-proxy, viacep
nginx-proxy    | WARNING: /etc/nginx/dhparam/dhparam.pem was not found. A pre-generated dhparam.pem will be used for now while a new one
nginx-proxy    | is being generated in the background.  Once the new dhparam.pem is in place, nginx will be reloaded.
nginx-proxy    | Can't open /etc/nginx/dhparam/dhparam.pem for writing, Is a directory
nginx-proxy    | 140258577540352:error:02001015:system library:fopen:Is a directory:../crypto/bio/bss_file.c:74:fopen('/etc/nginx/dhparam/dhparam.pem','w')
nginx-proxy    | 140258577540352:error:2006D002:BIO routines:BIO_new_file:system lib:../crypto/bio/bss_file.c:83:
nginx-proxy    | forego     | starting dockergen.1 on port 5000
nginx-proxy    | forego     | starting nginx.1 on port 5100
nginx-proxy    | dockergen.1 | 2019/04/09 22:21:27 Generated '/etc/nginx/conf.d/default.conf' from 2 containers
nginx-proxy    | dockergen.1 | 2019/04/09 22:21:27 Running 'nginx -s reload'
nginx-proxy    | dockergen.1 | 2019/04/09 22:21:27 Watching docker events
nginx-proxy    | dockergen.1 | 2019/04/09 22:21:28 Contents of /etc/nginx/conf.d/default.conf did not change. Skipping notification 'nginx -s reload'
viacep         |  * Environment: production
viacep         |    WARNING: Do not use the development server in a production environment.
viacep         |    Use a production WSGI server instead.
viacep         |  * Debug mode: off
viacep         |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
```	
 * Possivel alteração
```bash
dentro do arquivo docker-composer.yml podemos realizar a alteraçao do virtual host da API e da porta onde a mesma vai escutar.

ports:
      - "80:80" (Informar a porta que deseja que a aplicação escute)

- VIRTUAL_HOST=viacep.local (Informar o Virtual host desejado) 
```	  
 
 
 ## Alteração do arquivos hosts
 
Windows - C:\WINDOWS\system32\drivers\etc\hosts
Linux - /etc/hosts
 
```bash
192.168.15.82	viacep.local 
```	
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
