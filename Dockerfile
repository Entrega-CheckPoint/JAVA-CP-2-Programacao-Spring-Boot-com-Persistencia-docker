# Usar uma imagem oficial mínima do Java 21
FROM eclipse-temurin:21-jre

# Diretório onde vai ficar o JAR dentro do container
WORKDIR /app

# Copia o JAR da máquina host para o container
COPY checkpoint-0.0.1-SNAPSHOT.jar app.jar

# Porta que o Spring Boot vai abrir (opcional se quiser mapear depois no docker run)
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]
