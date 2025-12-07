docker build -t my-webserver .
docker run -d --name webserver -p 8080:8080 my-webserver
