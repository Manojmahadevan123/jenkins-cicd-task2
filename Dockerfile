FROM amazoncorretto:17
WORKDIR /app
COPY target/classes/ /app/
CMD ["java", "App"]
