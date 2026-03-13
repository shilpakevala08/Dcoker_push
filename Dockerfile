FROM openjdk:25
WORKDIR /app
COPY . /app
RUN javac HelloWorld.java
CMD ["java","HelloWorld"]
