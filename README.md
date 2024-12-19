Desafio Gocase

  

Índice

Introdução

Requisitos

Passo a Passo

Nginx

Dockerfile

docker-compose.yml

Conclusão

Introdução

Este repositório contém uma aplicação composta por frontend, backend e banco de dados, desenvolvida para atender ao desafio proposto pela Gocase. O objetivo principal é garantir a orquestração eficiente de todos os serviços, utilizando Docker e Nginx para simplificar a configuração, execução e manutenção.

Requisitos

Para executar este projeto, você precisará dos seguintes softwares instalados:

Docker

Docker Compose

Passo a Passo

Clone o repositório:

git clone <URL_DO_REPOSITORIO>
cd <PASTA_DO_REPOSITORIO>

Construa e inicialize os containers:

docker-compose up --build

Acesse a aplicação nos seguintes endereços:

Backend: http://localhost:3000

Frontend: http://localhost

Para interromper e remover os containers:

docker-compose down

Nginx

O Nginx desempenha um papel crucial na estrutura da aplicação, funcionando como servidor do frontend e balanceador de carga. A escolha do Nginx foi motivada pela sua eficiência no gerenciamento de requisições HTTP e pela capacidade de lidar com alto volume de tráfego com baixa utilização de recursos. Além disso, sua configuração permite:

Servir o conteúdo estático do frontend na porta 80, garantindo uma resposta rápida para os usuários finais.

Melhorar a performance e a escalabilidade da aplicação ao atuar como intermediário entre o cliente e os serviços backend.

Facilitar a manutenção e monitoramento, consolidando as requisições em um único ponto de entrada.

Dockerfile

O Dockerfile do backend foi projetado para criar um ambiente de execução consistente. Os principais passos são:

Imagem base: Utiliza ruby:2.7.7 para garantir compatibilidade com a aplicação.

Instalação de dependências: Inclui ferramentas como nodejs, yarn e bibliotecas do PostgreSQL para atender aos requisitos do backend.

Configuração do ambiente:

Copia os arquivos do projeto para o container.

Define a porta 3000 para comunicação do backend.

Configura o script entrypoint.sh como ponto de entrada para inicialização do container.

docker-compose.yml

O arquivo docker-compose.yml é responsável por orquestrar os serviços da aplicação, garantindo que eles funcionem de forma integrada:

Backend:

Porta: 3000:3000.

Variáveis de ambiente configuradas para integração com o banco de dados.

Dependência explícita do serviço db para garantir inicialização correta.

Banco de Dados (PostgreSQL):

Porta: 5432:5432.

Volume persistente para armazenar dados de forma durável.

Frontend:

Porta: 80:80.

Configurado para ser servido via Nginx.

Conclusão

Com essa arquitetura, a aplicação é executada de maneira coesa e simplificada. A combinação de Docker, Docker Compose e Nginx assegura uma implantação eficiente e uma experiência consistente para os desenvolvedores e usuários finais.
