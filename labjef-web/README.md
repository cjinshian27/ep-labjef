# Instalação

Java 17
```shell
$ sudo apt install openjdk-17-jdk
```

Gradle (usando gradle wrapper)
```shell
$ ./gradlew 
```

# Uso 

## Compilação e execução

### Opção 1: bootRun (compilação e execução automática)

```shell
$ ./gradlew bootRun
```

### Opção 2: compilação e execução manual

```shell
$ ./gradlew build
$ java -jar build/libs/labjef-web-0.0.1-SNAPSHOT.jar
```

> **Note**
> O gradle foi configurado com no-daemon (daemon é de "single use") na pasta
> gradle.properties, ou seja, o daemon termina automaticamente após a build.
> Caso o daemon não fosse de "single use", seria necessário terminá-lo
> manualmente com ` ./gradlew --stop `

## Acesso ao Home page

Após compilar e executar, a Home page pode ser acessada em http://localhost:8080

A Home page possui os links das páginas principais (lista de Pessoas, lista de
Perfis, etc.).

> **Note**
> A "navigation bar" no topo de cada página redireciona para a home page,
> funcionando como "botão de voltar".

> **Note**
> Se tentar apagar, por exemplo, uma pessoa que pertence a algum
> relacionamento, ocorrerá um erro. Não foi feita uma página de tratamento
> erros, então fica aqui um aviso por escrito: é necessário remover primeiro os
> relacionamentos em que essa pessoa pertence antes de remover a pessoa em si.

# Clean

Remover pasta build/ gerada

```shell
$ ./gradlew clean
```

# Referências

* [Código base](https://data.ime.usp.br/mac0350-2023/demo.zip) fornecido na
aula e nos slides de 

- Pedro Losco Takecian
- Leonardo Tadashi Kamaura

```shell
$ wget https://data.ime.usp.br/mac0350-2023/demo.zip
```

* [Guia Spring](https://spring.io/guides/gs/serving-web-content/) para fazer a
  Home page

* [Bootstrap](https://getbootstrap.com/docs/5.0/components/list-group/) CSS
  para estilizar a Home page
