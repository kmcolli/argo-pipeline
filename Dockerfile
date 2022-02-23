FROM nginx:latest
# deploy specific nginx configuration file
COPY environments/nginx.conf /etc/nginx/nginx.conf
COPY site/index.html /etc/nginx/html/index.html
COPY site/IBM-Cloud-Helper.postman_collection.json /etc/nginx/html/IBM-Cloud-Helper.postman_collection.json
# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx
# output port set WORKDIR to app

EXPOSE 80