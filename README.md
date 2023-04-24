# burger-eats

## Pré-requisitos

Para o correto funcionamento, é necessário seguir algumas configurações.

* Criar conta no <a href="https://www.cloudamqp.com/" target="blank">CloudAMQP</a>
* Criar conta no <a href="https://www.mongodb.com/" target="blank">MongoDB</a>
* Criar um conta no <a href="https://mailtrap.io/" target="blank">Mailtrap</a>

### Variáveis

No arquiv `.env` da pasta `api`, inserir as informações de conexão obtidas no cadastro, substituindo onde tem `???` pelo respectivo dado.

```bash
MONGO_URI=???
AMQP_URL=???
QUEUE_NAME=email
SEND_EMAIL=1
RECONNECT_TIMEOUT=600
```

Do `MongoDB` e do `CloudAMQP`.

No arquiv `.env` da pasta `mailer`, inserir as informações de conexão obtidas no cadastro, substituindo onde tem `???` pelo respectivo dado.

```bash
AMQP_URL=???
QUEUE_NAME=email

#SMTP
HOST=smtp.mailtrap.io
PORT=2525
USER=???
PASS=???
```

# Configurando o ambiente

Acessando o site do <a href="https://robotframework.org/" target="blank">Robot Framework</a> e dentro dele no menu de *Resources*, temos acessos a todas a Libraries para realizanção do download.
Clicando a Library <a href="https://github.com/MarketSquare/robotframework-requests#readme" target="blank">HTTP RequestsLibrary (Python), irá direcionar para a página do GitHub para download.

* Instalação

```bash
pip install robotframework-requests
```

Caso ter algum problema executar o comando.

```bash
python.exe -m pip install --upgrade pip
```

* Correção na massa de teste

A aplicação tem uma regra de negocio que não permite cadastrar mais de um parceiro com o mesmo nome, para corrigir isso vamos usar a library <a hreg="https://github.com/tarathep/robot-mongodb-library" target="blank">robot-mongodb-library</a>

```bash
pip install robot-mongodb-library
```

* Modulo Service Mongo

```bash
pip install "pymongo[srv]"
```

## Status Code

Por padrão a library HTTP Requests, só aceita *status code* da família *200*, iy seja sucesso. Para implementar outros tipos de status, é necessário investigar na documentação oficial da <a href="https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html" target="blank">HTTP Requests Library</a>
