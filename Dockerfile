FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app

COPY . .

# Compile
RUN javac src/Main.java

# Run
CMD ["java", "-cp", "src", "HelloWorld"]
