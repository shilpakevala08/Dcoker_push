FROM openjdk:25
WORKDIR /app
COPY . .
RUN javac HelloWorld.java
CMD ["java","HelloWorld"]
