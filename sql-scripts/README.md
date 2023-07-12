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

## Reiniciar servidor

```shell
$ sudo service postgresql restart
```

# Uso

## Preparação do ambiente

```shell
$ sudo -u postgres psql
postgres=# CREATE USER testeusr WITH ENCRYPTED PASSWORD 'testeusr';
postgres=# CREATE DATABASE teste WITH OWNER testeusr;
```

## Scripts

Acessar banco de dados "teste" como usuário "testeusr"

```shell
$ psql -U testeusr teste

teste=#
```

Após rodar o comando acima, podemos começar a rodar os scripts sql.

> **Note**
> Substitua path_to nas seções seguintes com o caminho relativo dos arquivos
> correspondentes. Por exemplo: `\i create.sql` se tiver acessando o banco de
> dados a partir da pasta sql-scripts/ (onde os scripts estão localizados).

#### Criar tabelas.

```shell
teste=# \i path_to/create.sql
```

#### Criar funções para as consultas.

```shell
teste=# \i path_to/query.sql
```

#### Inserir instâncias nas tabelas.

```shell
teste=# \i path_to/insert.sql
```

#### Realizar as consultas.

```shell
teste=# SELECT * FROM servicos_por_pessoa();
teste=# SELECT * FROM servicos_utilizados_por_perfil();
teste=# SELECT * FROM cinco_disciplinas_mais_oferecidas();
teste=# SELECT * FROM cinco_docentes_que_mais_ministraram();
```

#### Remover tabelas e funções.

```shell
teste=# \i path_to/drop.sql
```

## Desfazer ambiente

```shell
$ sudo -u postgres psql
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

# Referências

Instalação e configuração do postgresql baseada na aula e nos slides de

- Pedro Losco Takecian
- Leonardo Tadashi Kamaura
