# Alunos da Obra do Berço

Portfolio com alunos da Ong Obra do Berço

- Ruby: 2.7.2
- Rails: 6.1.3
- Banco de dados: PostgreSQL

## Para executar o projeto

1. Suba o docker com o banco

```
docker-compose up
```

2. Certifique-se de que o banco exista e tenha dados

```
bin/rake db:create db:migrate db:seed
```

3. Suba o servidor do Rails

```
bin/rails s
```
