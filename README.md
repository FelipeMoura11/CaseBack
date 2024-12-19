
# **Desafio Gocase**

![Docker](https://img.shields.io/badge/Docker-Enabled-blue) ![Nginx](https://img.shields.io/badge/Nginx-Configured-green) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15--alpine-blue)

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

Para executar este projeto, você precisará dos seguintes softwares instalados:

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

---

## **Configuração e Execução**

### **Estrutura do Projeto**

Certifique-se de clonar os repositórios do **frontend** e **backend** na mesma pasta. A estrutura final será:

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
Para construir e inicializar os containers, execute:

docker-compose up --build


	2.	Acessar os Serviços
	•	Frontend: http://localhost
	•	Backend: http://localhost:3000
	3.	Encerrar e Remover os Containers
Para interromper a execução e remover os containers, execute:

docker-compose down

Nginx

O Nginx desempenha um papel crucial na estrutura da aplicação, funcionando como servidor do frontend e balanceador de carga. A escolha do Nginx foi motivada pela sua eficiência no gerenciamento de requisições HTTP e pela capacidade de lidar com alto volume de tráfego com baixa utilização de recursos.

Vantagens do Nginx:
	•	Serviço de conteúdo estático: Serve o frontend na porta 80, garantindo rápida entrega aos usuários finais.
	•	Escalabilidade e desempenho: Atua como intermediário entre o cliente e os serviços backend, otimizando a performance.
	•	Manutenção centralizada: Consolida as requisições em um único ponto de entrada, facilitando o monitoramento e suporte.

Dockerfile

O arquivo Dockerfile do backend foi projetado para criar um ambiente de execução consistente, seguindo os passos:
	1.	Imagem base: Utiliza ruby:2.7.7 para garantir compatibilidade com a aplicação.
	2.	Instalação de dependências: Instala nodejs, yarn e bibliotecas do PostgreSQL para suportar as funcionalidades do backend.
	3.	Configuração do ambiente:
	•	Copia os arquivos do projeto para o container.
	•	Define a porta 3000 para comunicação do backend.
	•	Configura o script entrypoint.sh como ponto de entrada para inicialização.

docker-compose.yml

O arquivo docker-compose.yml orquestra os serviços da aplicação, conectando-os de forma integrada e eficiente:
	•	Backend:
	•	Porta exposta: 3000:3000.
	•	Integração com o banco de dados através de variáveis de ambiente.
	•	Dependência explícita do serviço db para garantir inicialização ordenada.
	•	Banco de Dados (PostgreSQL):
	•	Porta exposta: 5432:5432.
	•	Volume configurado para persistir os dados armazenados.
	•	Frontend:
	•	Porta exposta: 80:80.
	•	Configurado para ser servido diretamente via Nginx.

Tecnologias Utilizadas
	•	Frontend: Framework moderno para interfaces dinâmicas.
	•	Backend: API robusta para comunicação entre serviços.
	•	Banco de Dados: PostgreSQL como sistema de gerenciamento de banco de dados relacional.
	•	Docker: Contêineres para garantir consistência do ambiente.
	•	Nginx: Proxy reverso e servidor de conteúdo estático.

Conclusão

Esta arquitetura combina tecnologias modernas para oferecer uma aplicação robusta e fácil de gerenciar. Com Docker, Docker Compose e Nginx, garantimos uma implantação eficiente e uma experiência consistente tanto para desenvolvedores quanto para usuários finais. Siga o passo a passo para configurar e explorar este projeto!

Esse é o **README.md** completo, conforme o formato e as novas informações sobre como rodar a aplicação localmente, que você solicitou.