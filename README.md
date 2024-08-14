# API Rest Ruby

- Uma simples API Rest em Ruby, apenas para estudo.
- Uma API que manipula dados numm json.

## Instalação

- Instale o Ruby;

```bash
sudo apt-get install gem
```

- Instale o Bundler;

```bash
sudo gem install bundler
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
