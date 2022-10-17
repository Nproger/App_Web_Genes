FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN app_web_genes create-db
RUN app_web_genes populate-db
RUN app_web_genes add-user -u admin -p admin
EXPOSE 5000
CMD ["app_web_genes", "run"]
