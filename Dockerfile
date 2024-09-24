# Step 1: Use the official OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy Maven wrapper and pom.xml to the container
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

# Step 4: Run Maven to download dependencies and build the application
RUN ./mvnw clean package -DskipTests

# Step 5: Copy the final Spring Boot JAR into the container
COPY target/ServiceReg-0.0.1-SNAPSHOT.jar /app/ServiceReg.jar

# Step 6: Expose the port your Spring Boot application will run on
EXPOSE 8761

# Step 7: Define the command to run the application
ENTRYPOINT ["java", "-jar", "/app/ServiceReg.jar"]
