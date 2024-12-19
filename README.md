# Desafio Gocase

![Docker](https://img.shields.io/badge/Docker-Enabled-blue) ![Nginx](https://img.shields.io/badge/Nginx-Configured-green) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15--alpine-blue)

## Índice

- [Introdução](#introdução)
- [Requisitos](#requisitos)
- [Passo a Passo](#passo-a-passo)
- [Executando a Aplicação Localmente](#executando-a-aplicação-localmente)
- [Nginx](#nginx)
- [Dockerfile](#dockerfile)
- [docker-compose.yml](#docker-composeyml)
- [Conclusão](#conclusão)

## Introdução

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Este repositório contém uma aplicação composta por frontend, backend e banco de dados, desenvolvida para atender ao desafio proposto. O objetivo principal é garantir a orquestração eficiente de todos os serviços, utilizando Docker e Nginx para simplificar a configuração, execução e manutenção.
</p>

## Requisitos

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Para executar este projeto, você precisará dos seguintes softwares instalados:
</p>

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Passo a Passo

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Siga os passos abaixo para configurar e executar a aplicação:
</p>

1. Clone o repositório:

   ```bash
   git clone <URL_DO_REPOSITORIO>
   cd <PASTA_DO_REPOSITORIO>

	2.	Construa e inicialize os containers:

docker-compose up --build


	3.	Acesse a aplicação nos seguintes endereços:
	•	Backend: http://localhost:3000
	•	Frontend: http://localhost
	4.	Para interromper e remover os containers:

docker-compose down



Executando a Aplicação Localmente

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Para executar a aplicação localmente, tanto o frontend quanto o backend devem ser clonados na mesma pasta. Siga os passos abaixo:
</p>


Passos
	1.	Clone os repositórios

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Certifique-se de que os repositórios do frontend e backend sejam clonados na mesma pasta no seu sistema local. Por exemplo:
</p>


mkdir desafio-gocase
cd desafio-gocase
git clone <URL_DO_REPOSITORIO_FRONTEND> frontend
git clone <URL_DO_REPOSITORIO_BACKEND> backend

Após isso, a estrutura de diretórios ficará assim:

desafio-gocase/
├── frontend/
└── backend/


	2.	Entre na pasta do backend

<p style="font-size: 14px; line-height: 1.6; color: #444;">
O arquivo `docker-compose.yml` está localizado no repositório do backend. Por isso, os comandos devem ser executados a partir dessa pasta.
</p>


cd backend


	3.	Execute o docker-compose

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Para construir as imagens Docker e inicializar os serviços, use o comando:
</p>


docker-compose up --build


	4.	Acesse a aplicação

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Após iniciar os containers, os serviços estarão disponíveis nos seguintes endereços:
</p>
- **Frontend**: [http://localhost](http://localhost)
- **Backend**: [http://localhost:3000](http://localhost:3000)



	5.	Encerrar os containers

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Para parar a aplicação e remover os containers, execute:
</p>


docker-compose down



Nginx

<p style="font-size: 14px; line-height: 1.6; color: #444;">
O **Nginx** desempenha um papel crucial na estrutura da aplicação, funcionando como servidor do frontend e balanceador de carga. A escolha do Nginx foi motivada pela sua eficiência no gerenciamento de requisições HTTP e pela capacidade de lidar com alto volume de tráfego com baixa utilização de recursos.
</p>


Vantagens do Nginx:
	•	Serviço de conteúdo estático: Serve o frontend na porta 80, garantindo rápida entrega aos usuários finais.
	•	Escalabilidade e desempenho: Atua como intermediário entre o cliente e os serviços backend, otimizando a performance.
	•	Manutenção centralizada: Consolida as requisições em um único ponto de entrada, facilitando o monitoramento e suporte.

Dockerfile

<p style="font-size: 14px; line-height: 1.6; color: #444;">
O arquivo **Dockerfile** do backend foi projetado para criar um ambiente de execução consistente, seguindo os passos:
</p>


	1.	Imagem base: Utiliza ruby:2.7.7 para garantir compatibilidade com a aplicação.
	2.	Instalação de dependências: Instala nodejs, yarn e bibliotecas do PostgreSQL para suportar as funcionalidades do backend.
	3.	Configuração do ambiente:
	•	Copia os arquivos do projeto para o container.
	•	Define a porta 3000 para comunicação do backend.
	•	Configura o script entrypoint.sh como ponto de entrada para inicialização.

docker-compose.yml

<p style="font-size: 14px; line-height: 1.6; color: #444;">
O arquivo **docker-compose.yml** orquestra os serviços da aplicação, conectando-os de forma integrada e eficiente:
</p>


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

Conclusão

<p style="font-size: 14px; line-height: 1.6; color: #444;">
Esta arquitetura combina tecnologias modernas para oferecer uma aplicação robusta e fácil de gerenciar. Com Docker, Docker Compose e Nginx, garantimos uma implantação eficiente e uma experiência consistente tanto para desenvolvedores quanto para usuários finais. Siga o passo a passo para configurar e explorar este projeto!
</p>
```


Essa versão inclui <p> com estilo embutido para melhorar a leitura e o visual do texto. Pode ser colada diretamente no arquivo README.md.