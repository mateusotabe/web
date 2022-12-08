# Ambiente de dev com PHP, Node, MySql, Postgres e Nginx

##### Esse ambiente utiliza a porta 80, deve-se desabilitar qualquer serviço que utilize essa porta.

## Instrução Geral
Alterar o usuário e o id no _docker-compose.yml_ para o usuário da máquina de desenvolvimento.

## App PHP
1. Criar um diretório com o nome do app, dentro de __www__ _(www/meuapp.teste/)_
2. Criar o arquivo __.conf__ no diretório __server/sites__ com o mesmo nome do diretório do passo anterior _(server/sites/meuapp.teste.conf)_.
		- Utilizar o arquivo __php.test.conf__ como base.
		- O __server_name__ é o endereço da aplicação. Deve ser o mesmo nome do diretório criado no passo 1. _(server_name meuapp.teste)_.
3. Criar o hostname do app no arquivo __/etc/hosts__ _(127.0.0.1	meuapp.teste)_.

## App Node
1. Criar um diretório com o nome do app dentro de __www__ _(www/nodeapp.teste/)_
2. No arquivo __docker_compose.yml__ adicionar o container da aplicação node, usando o __web_node__ como exemplo.
		- Alterar o nome do container. __(container_name: nodeapp)__
		- Criar o volume do diretório criado no passo 1 linkado ao workdir. _(- ./www/nodeapp.teste:/app)_
3. Criar o arquivo __.conf__ no diretório __server/sites__ com o mesmo nome da pasta do passo anterior _(server/sites/nodeapp.teste.conf)_.
		- Utilizar o arquivo __node.test.conf__ como base.
		- O __server_name__ é o endereço da aplicação. Deve ser o mesmo do diretório criado no passo 1. _(server_name nodeapp.teste)_.
		- O __proxy_pass__ deve apontar para o nome do container com o app, criado no passo 2, e a porta que ele escuta. _(prox_pass http://nodeapp:3000)_
4. Criar o hostname do app no arquivo __/etc/hosts__ _(127.0.0.1	nodeapp.teste)_.

---

#### v1.1
