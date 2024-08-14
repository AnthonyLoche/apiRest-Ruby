require 'sinatra'
require 'json'
require 'fileutils'

set :port, 3000

DATA_FILE = 'dados.json'

# Certifique-se de que o arquivo JSON existe
FileUtils.touch(DATA_FILE) unless File.exist?(DATA_FILE)

# Rota GET para "Hello World"
get '/' do
  'Hello World'
end

# Lê os dados do arquivo JSON
def read_data
  JSON.parse(File.read(DATA_FILE))
rescue JSON::ParserError
  [] # Retorna um array vazio se o arquivo estiver vazio ou corrompido
end

# Escreve dados no arquivo JSON
def write_data(data)
  File.write(DATA_FILE, JSON.pretty_generate(data))
end

# Rota GET para obter todos os dados
get '/dados' do
  content_type :json
  read_data.to_json
end

# Rota GET para obter um dado específico
get '/dados/:id' do
  content_type :json
  dados = read_data
  dado = dados.find { |d| d['id'] == params['id'].to_i }
  if dado
    dado.to_json
  else
    status 404
    { error: 'Dado não encontrado' }.to_json
  end
end

# Rota POST para adicionar novos dados
post '/dados' do
  content_type :json
  novo_dado = JSON.parse(request.body.read)
  dados = read_data
  novo_dado['id'] = (dados.map { |d| d['id'] }.max || 0) + 1
  dados << novo_dado
  write_data(dados)
  status 201
  novo_dado.to_json
end

# Rota PUT para atualizar dados existentes
put '/dados/:id' do
  content_type :json
  dados = read_data
  dado = dados.find { |d| d['id'] == params['id'].to_i }
  if dado
    atualizado = JSON.parse(request.body.read)
    dado.merge!(atualizado)
    write_data(dados)
    dado.to_json
  else
    status 404
    { error: 'Dado não encontrado' }.to_json
  end
end

# Rota DELETE para remover dados
delete '/dados/:id' do
  content_type :json
  dados = read_data
  dado = dados.find { |d| d['id'] == params['id'].to_i }
  if dado
    dados.delete(dado)
    write_data(dados)
    status 204 # No Content
  else
    status 404
    { error: 'Dado não encontrado' }.to_json
  end
end

# Iniciar o servidor
if __FILE__ == $0
  Sinatra::Application.run!
end
