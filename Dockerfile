# Step 1: Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the Maven build files (pom.xml and dependencies)
COPY pom.xml ./
COPY src ./src

# Step 4: Package the application using Maven
RUN ./mvnw package -DskipTests

# Step 5: Copy the JAR file built by Maven to the app directory
COPY target/ServiceReg-0.0.1-SNAPSHOT.jar /app/ServiceReg.jar

# Step 6: Expose port 8761 (or whichever port your Spring Boot application uses)
EXPOSE 8761

# Step 7: Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app/ServiceReg.jar"]
