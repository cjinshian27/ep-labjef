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

Compilação e execução

## Opção 1: bootRun

```shell
$ ./gradlew bootRun
```

## Opção 2: compilação e execução manual

```shell
$ ./gradlew build
$ java -jar build/libs/labjef-web-0.0.1-SNAPSHOT.jar
```

# Clean

Remover pasta build/ gerada

```shell
$ ./gradlew clean
```

# Referências

[Código base](https://data.ime.usp.br/mac0350-2023/demo.zip) fornecido na
aula e nos slides de 

- Pedro Losco Takecian
- Leonardo Tadashi Kamaura

```shell
$ wget https://data.ime.usp.br/mac0350-2023/demo.zip
```
