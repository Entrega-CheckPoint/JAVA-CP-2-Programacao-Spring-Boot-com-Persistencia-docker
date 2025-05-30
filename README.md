# JAVA-CP-2-Programacao-Spring-Boot-com-Persistencia

## Objetivo

Desenvolver uma aplicação Java utilizando o framework **Spring Boot** com **persistência em banco de dados Oracle**, capaz de realizar operações básicas de cadastro e consulta de brinquedos.

A aplicação expõe dois endpoints principais (CREATE e READ), acessíveis via **Postman** para simulação de chamadas HTTP. Além disso, foram aplicadas boas práticas visando escalabilidade e manutenção em sistemas maiores.

## Iniciação do Projeto - Spring Initializr

A estrutura inicial do projeto foi gerada utilizando o [**Spring Initializr**](https://start.spring.io/).

### Parâmetros

- **Project:** Maven
- **Language:** Java
- **Spring Boot:** 3.4.5
- **Group:** fiap.com.br
- **Artifact:** checkpoint
- **Packaging** Jar
- **Java Version:** 21

### Dependências adicionadas

<details>
  <summary><b>Spring Web</b></summary>

```xml
    	<dependency>
    		<groupId>org.springframework.boot</groupId>
    		<artifactId>spring-boot-starter-web</artifactId>
    	</dependency>
```

</details>

<details>
  <summary><b>Spring Data JPA</b></summary>

```xml
        <dependency>
    		<groupId>org.springframework.boot</groupId>
    		<artifactId>spring-boot-starter-data-jpa</artifactId>
    	</dependency>
```

</details>

<details>
  <summary><b>Validation</b></summary>

```xml
    	<dependency>
    		<groupId>org.springframework.boot</groupId>
    		<artifactId>spring-boot-starter-validation</artifactId>
    	</dependency>
```

</details>

<details>
  <summary><b>Spring Boot DevTools</b></summary>

```xml
    	<dependency>
    		<groupId>org.springframework.boot</groupId>
    		<artifactId>spring-boot-devtools</artifactId>
    		<scope>runtime</scope>
    		<optional>true</optional>
    	</dependency>
```

</details>

<details>
  <summary><b>Banco de dados H2</b></summary>

```xml
		<dependency>
			<groupId>com.h2database</groupId>
			<artifactId>h2</artifactId>
			<scope>runtime</scope>
		</dependency>
```

</details>

## Estrutura do Projeto e Pacotes

<details>
  <summary><b>Check Point</b></summary>

```
\---checkpoint
    +---.idea
    +---.mvn
    |   \---wrapper
    +---src
    |   +---main
    |   |   +---java
    |   |   |   \---fiap
    |   |   |       \---com
    |   |   |           \---br
    |   |   |               \---checkpoint
    |   |   |                   +---Controller
    |   |   |                   +---Dao
    |   |   |                   +---Exception
    |   |   |                   \---Model
    |   |   \---resources
    |   |       +---static
    |   |       \---templates
    |   \---test
    |       \---java
    |           \---fiap
    |               \---com
    |                   \---br
    |                       \---checkpoint
    \---target
        +---classes
        |   \---fiap
        |       \---com
        |           \---br
        |               \---checkpoint
        |                   +---Controller
        |                   +---Dao
        |                   +---Exception
        |                   \---Model
        +---generated-sources
        |   \---annotations
        +---generated-test-sources
        |   \---test-annotations
        +---maven-archiver
        +---maven-status
        |   \---maven-compiler-plugin
        |       +---compile
        |       |   \---default-compile
        |       \---testCompile
        |           \---default-testCompile
        +---surefire-reports
        \---test-classes
            \---fiap
                \---com
                    \---br
                        \---checkpoint
```

</details>

### **Model:**

Entidades que representam as tabelas do banco, nesta aplicação temos apenas a classe `Brinquedo`.

```java
public class Brinquedo {

    private int id;
    private String nome;
    private String tipo;
    private int classificacao;
    private double tamanho;
    private double preco;

}
```

### **Exception:**

Exceções personalizadas para controle de fluxo.

### **Dao:**

Contém os DAOs, incluindo a implementação genérica e específica.

Função do DAO genérico é de padronizar os método do CRUD de forma que possamos reciclar em outras classes.

> _Aplicação do método DRY - Don't Repeat Your'self_

Temos então:

- _interface GenericDao_ : Indica os métodos necessários que a classe deve implementar
- _abstract class GenericDaoImpl_ : A classe abstrata GenericDaoImpl implementa os métodos de CRUD de forma genérica, podendo ser reutilizada por várias entidades em projetos maiores.
- _interface BrinquedoDao_ : Uso de boas práticas, apenas extende a interface GenericDao
- _class BrinquedoDaoImpl_ : ao extender a classe GenericDaoImpl, ele possui os métodos do CRUD já definidos

### **Controller:**

Define os endpoints REST.

- _class BrinquedoController_ : define as URLs e métodos a serem usados.

## Testes com Postman

### Link para teste -> [**POSTMAN**](https://.postman.co/workspace/My-Workspace~ace83ca3-a705-4856-8f00-2ca41eed6e99/folder/38911868-431f87bd-f6b2-4040-aaf2-df8913466caa?action=share&creator=38911868&ctx=documentation)

Os testes foram realizados utilizando o Postman com os endpoints mapeados em `BrinquedoController`.

A aplicação será iniciada na porta padrão `8080`:

```
http://104.41.50.45:8080
```

### **POST - Cadastrar Brinquedo**

**URL:** `http://104.41.50.45:8080/Brinquedos/Cadastrar`
**Método:** `POST`
**Body (JSON):**

```json
{
  "nome": "Lego Batman",
  "tipo": "Montar",
  "classificacao": 12,
  "tamanho": 15.5,
  "preco": 139.9
}
```

### **GET - Listar Todos**

**URL:** `http://104.41.50.45:8080/Brinquedos`
**Método:** `GET`

### **GET - Buscar por ID**

**URL:** `http://104.41.50.45:8080/Brinquedos/{id}`
**Método:** `GET`

### **DELETE - Remover Brinquedo**

**URL:** `http://104.41.50.45:8080/Brinquedos/{id}`
**Método:** `DELETE`

## **_Aplicação em DOCKER_**

> Aplicação pode estar fora do ar pela entrega de outro CheckPoints
