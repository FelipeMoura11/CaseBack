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
	1.	Subir os Containers
Para construir e inicializar os containers:

docker-compose up --build


	2.	Acessar os Serviços
	•	Frontend: http://localhost
	•	Backend: http://localhost:3000
	3.	Encerrar e Remover os Containers
Para interromper a execução e remover os containers:

docker-compose down

Nginx

O Nginx é usado como servidor para o frontend e como proxy reverso para o backend. Suas principais funções incluem:
	•	Servir conteúdo estático (frontend) na porta 80.
	•	Encaminhar requisições do backend na porta 3000.
	•	Garantir escalabilidade e gerenciamento eficiente de requisições.

Dockerfile

O arquivo Dockerfile do backend inclui:
	•	Imagem Base: ruby:2.7.7 (compatível com o ambiente da aplicação).
	•	Dependências: Instalação do nodejs, yarn e bibliotecas para o PostgreSQL.
	•	Setup do Ambiente:
	•	Cópia dos arquivos do projeto.
	•	Exposição da porta 3000.
	•	Configuração do script de inicialização.

docker-compose.yml

O arquivo docker-compose.yml orquestra os serviços da aplicação:
	•	Backend:
	•	Porta exposta: 3000:3000.
	•	Conexão com o banco de dados via variáveis de ambiente.
	•	Dependência do serviço db.
	•	Banco de Dados (PostgreSQL):
	•	Porta exposta: 5432:5432.
	•	Persistência dos dados configurada com volumes.
	•	Frontend:
	•	Porta exposta: 80:80.
	•	Configurado para ser servido diretamente pelo Nginx.

Tecnologias Utilizadas
	•	Frontend: Framework moderno para interfaces dinâmicas.
	•	Backend: API robusta para comunicação entre serviços.
	•	Banco de Dados: PostgreSQL como sistema de gerenciamento de banco de dados relacional.
	•	Docker: Contêineres para garantir consistência do ambiente.
	•	Nginx: Proxy reverso e servidor de conteúdo estático.

Conclusão

Este projeto combina tecnologias modernas para oferecer uma solução completa e eficiente. Siga o guia acima para configurar e executar a aplicação localmente, explorando suas funcionalidades e entendendo a arquitetura proposta.

Este formato de **README.md** está bem organizado para o GitHub, com títulos, listas, links e comandos adequadamente formatados, criando uma leitura fluida e clara para quem for usar o repositório.