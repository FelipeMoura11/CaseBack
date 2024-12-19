# Use uma imagem base com Ruby 2.7.7
FROM ruby:2.7.7

ENV SECRET_KEY_BASE=1234
# Define o diretório de trabalho dentro do container
WORKDIR /app

# Instala dependências do sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  --no-install-recommends && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

# Copia o Gemfile e o Gemfile.lock para dentro do container
COPY Gemfile Gemfile.lock ./

# Instala a versão correta do Bundler
RUN gem install bundler -v 2.4.22

# Instala as dependências do projeto usando o Bundler compatível
RUN bundle install

# Copia o restante da aplicação para o container
COPY . .

# Copia o script de entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Exponha a porta padrão do Rails
EXPOSE 3000

# Define o script de entrada
ENTRYPOINT ["entrypoint.sh"]
