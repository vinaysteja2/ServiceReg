# Step 1: Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the Maven wrapper and project files into the container
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Step 4: Build the application with Maven (ensuring the JAR gets built)
RUN ./mvnw clean package -DskipTests

# Step 5: Copy the JAR file into the container
COPY target/ServiceReg-0.0.1-SNAPSHOT.jar /app/ServiceReg.jar

# Step 6: Expose port 8761 (if your Spring Boot app uses a different port, modify this)
EXPOSE 8761

# Step 7: Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/ServiceReg.jar"]
