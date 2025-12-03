FROM openjdk:17.0.2-slim

RUN apt-get update && apt-get install -y curl unzip

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
