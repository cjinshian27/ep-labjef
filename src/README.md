# Instalação

```shell
$ sudo apt install postgresql
```

# Permissões

## Arquivo pg_hba.conf

Modifique/adicione as seguintes linhas.

```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     scram-sha-256
host    all             all             0.0.0.0/0               scram-sha-256
host    all             all             ::/0                    scram-sha-256
```

## Arquivo postgresql.conf

Modifique e descomente as seguintes linhas.

```
listen_addresses = '*'
```

```
password_encryption = scram-sha-256
```

# Uso

## Preparação do ambiente

```shell
$ sudo -u postgres psql

postgres=# CREATE USER testeusr WITH ENCRYPTED PASSWORD 'testeusr';
postgres=# CREATE DATABASE teste WITH OWNER testeusr;
postgres=# \c teste;
```

## Scripts

**Note** Substitua path_to com o caminho dos arquivos correspondentes.

Criar tabelas.

```shell
teste=# \i path_to/create.sql
```

Criar funções para as consultas.

```shell
teste=# \i path_to/query.sql
```

Inserir instâncias nas tabelas.

```shell
teste=# \i path_to/insert.sql
```

Remover tabelas.

```shell
teste=# \i path_to/drop.sql
```

## Desfazer ambiente


```shell
teste=# \c postgres

postgres=# DROP DATABASE IF EXISTS teste;
postgres=# DROP USER IF EXISTS testeusr;
```

Liste os bancos de dados com o comando \l e verifique se o banco de dados
'teste' foi removido

```shell
postgres=# \l;
```

Liste os usuários com o comando \du e verifique se o usuário 'testeusr' foi
removido

```shell
postgres=# \du;
```
