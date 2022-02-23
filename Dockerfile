FROM nginx:latest
# deploy specific nginx configuration file
COPY --from=kanikoImage environments/nginx.conf /etc/nginx/nginx.conf
COPY site/index.html /etc/nginx/html/index.html
# support running as arbitrary user which belogs to the root group
RUN chmod g+rwx /var/cache/nginx /var/run /var/log/nginx  && chmod -R g+w /etc/nginx
# output port set WORKDIR to app

EXPOSE 80