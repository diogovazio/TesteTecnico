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
	
	* Configurar o repositorio estavel do Docker

```bash
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"
```	
	
	* Atualizar os pacotes
```bash
sudo apt-get update
```	

 * Istalar os pacotes atualizados do Docker
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
```	
