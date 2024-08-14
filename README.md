# API Rest Ruby

- Uma simples API Rest em Ruby, apenas para estudo.
- Uma API que manipula dados numm json.

## Instalação

- Instale o Ruby;

```bash
sudo apt-get install gem
```

- Instale o Ruby Dev;

```bash
sudo apt-get install ruby-dev
```

- Instale o Bundler;

```bash
sudo gem install bundler
```

- Ajuste o `path` do Vendor;

```bash
bundle install --path vendor/bundle
```

- Instale os pacotes do projeto;

```bash
gem install sinatra json
```

- Clone o repositório;
- Execute o comando `bundle install` para instalar as dependências;
- Execute o comando `ruby app.rb` para iniciar o servidor;
- Acesse `http://localhost:3000`;

## Rotas

- GET `/` - Retorna uma mensagem de boas-vindas;
- GET `/dados` - Retorna todos os dados;
- GET `/dados/:id` - Retorna um dado específico;
- POST `/dados` - Cria um novo dado;
- PUT `/dados/:id` - Atualiza um dado específico;
- DELETE `/dados/:id` - Deleta um dado específico;
