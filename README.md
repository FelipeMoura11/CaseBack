# **Desafio Gocase**

![Docker](https://img.shields.io/badge/Docker-Enabled-blue) ![Nginx](https://img.shields.io/badge/Nginx-Configured-green) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15--alpine-blue)

---

## **Índice**

- [Introdução](#introdução)
- [Requisitos](#requisitos)
- [Configuração e Execução](#configuração-e-execução)
  - [Estrutura do Projeto](#estrutura-do-projeto)
  - [Configuração do Ambiente](#configuração-do-ambiente)
  - [Comandos Principais](#comandos-principais)
- [Nginx](#nginx)
- [Dockerfile](#dockerfile)
- [docker-compose.yml](#docker-composeyml)
- [Tecnologias Utilizadas](#tecnologias-utilizadas)
- [Conclusão](#conclusão)

---

## **Introdução**

Este projeto implementa uma solução completa composta por **frontend**, **backend** e **banco de dados**, utilizando **Docker** e **Nginx** para orquestração e configuração. A arquitetura foi projetada para ser robusta, escalável e de fácil manutenção.

---

## **Requisitos**

Antes de começar, garanta que os seguintes softwares estão instalados no seu sistema:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## **Configuração e Execução**

### **Estrutura do Projeto**

Certifique-se de clonar os repositórios do **frontend** e do **backend** na mesma pasta. A estrutura final será:

```plaintext
desafio-gocase/
├── frontend/
└── backend/

Configuração do Ambiente
	1.	Clonar os Repositórios
Clone os repositórios do frontend e backend na mesma pasta:

mkdir desafio-gocase
cd desafio-gocase
git clone <URL_DO_REPOSITORIO_FRONTEND> frontend
git clone <URL_DO_REPOSITORIO_BACKEND> backend


	2.	Entrar na Pasta do Backend
Todos os comandos principais para subir a aplicação serão executados na pasta backend, onde está o arquivo docker-compose.yml:

cd backend


	3.	Configurar Variáveis de Ambiente
Crie ou edite o arquivo .env com as seguintes variáveis:

POSTGRES_USER=usuario
POSTGRES_PASSWORD=senha
POSTGRES_DB=nome_do_banco



Comandos Principais
	1.	Construir e Subir os Containers
Execute o comando abaixo para construir as imagens Docker e iniciar os serviços:

docker-compose up --build


	2.	Acessar os Serviços
	•	Frontend: http://localhost
	•	Backend: http://localhost:3000
	3.	Parar e Remover os Containers
Para parar os containers e limpar o ambiente:

docker-compose down


	4.	Logs dos Containers
Para acompanhar os logs de execução:

docker-compose logs -f

Nginx

O Nginx foi configurado para:
	•	Servir o frontend na porta 80.
	•	Redirecionar requisições ao backend na porta 3000.

Configuração

Exemplo do arquivo de configuração:

server {
    listen 80;

    location / {
        root /usr/share/nginx/html;
        index index.html;
        try_files $uri /index.html;
    }

    location /api/ {
        proxy_pass http://backend:3000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}

Dockerfile

O Dockerfile foi configurado para garantir um ambiente consistente:
	•	Imagem base: ruby:2.7.7
	•	Dependências: Instalação de nodejs, yarn e bibliotecas do PostgreSQL.
	•	Configuração: Porta 3000 exposta e script entrypoint.sh definido.

docker-compose.yml

O arquivo docker-compose.yml orquestra os serviços frontend, backend e banco de dados.

Serviços
	•	Frontend:
	•	Porta: 80:80
	•	Servido pelo Nginx.
	•	Backend:
	•	Porta: 3000:3000
	•	Conectado ao banco de dados.
	•	Banco de Dados:
	•	Porta: 5432:5432
	•	Volume para persistência de dados.

Exemplo do Arquivo

version: '3.8'
services:
  frontend:
    build:
      context: ../frontend
    ports:
      - "80:80"
    depends_on:
      - backend

  backend:
    build:
      context: .
    ports:
      - "3000:3000"
    depends_on:
      - db
    environment:
      - DATABASE_URL=postgresql://usuario:senha@db:5432/nome_do_banco

  db:
    image: postgres:15-alpine
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER: usuario
      POSTGRES_PASSWORD: senha
      POSTGRES_DB: nome_do_banco
    volumes:
      - postgres_data:/var/lib/postgresql/data

volumes:
  postgres_data:

Tecnologias Utilizadas
	•	Docker: Containerização de serviços.
	•	Docker Compose: Orquestração de múltiplos containers.
	•	Nginx: Servidor HTTP e proxy reverso.
	•	PostgreSQL: Banco de dados relacional.

Conclusão

A arquitetura proposta é moderna e eficiente, utilizando ferramentas que garantem escalabilidade e facilidade de manutenção. O uso do Docker e Nginx permite que o ambiente seja configurado e executado rapidamente. Siga os passos descritos para executar o projeto localmente e aproveite a experiência completa.

### Melhorias:
- **Separação visual**: Divisão clara entre as seções com uso de linhas (`---`) e formatação consistente.
- **Estrutura refinada**: Texto mais organizado e linguagem fluida.
- **Comando em destaque**: Formatação em código para maior clareza.
- **Fluxo natural**: Explicações conectadas e simplificadas.