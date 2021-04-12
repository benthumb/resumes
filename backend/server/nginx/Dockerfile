FROM nginx:latest
COPY ./nginx.conf /etc/nginx/nginx.conf
#RUN mkdir -p /opt/app && chown -R nginx:nginx /opt/app && chmod -R 775 /opt/app
RUN mkdir -p /opt/app/css_drafts && chown -R nginx:nginx /opt/app/css_drafts && chmod -R 775 /opt/app/css_drafts
RUN chown -R nginx:nginx /var/cache/nginx && \
   chown -R nginx:nginx /var/log/nginx && \
   chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
   chown -R nginx:nginx /var/run/nginx.pid
RUN chgrp -R root /var/cache/nginx /var/run /var/log/nginx /var/run/nginx.pid && \
   chmod -R 775 /var/cache/nginx /var/run /var/log/nginx /var/run/nginx.pid
COPY ./start-nginx.sh /usr/bin/start-nginx.sh
RUN chmod +x /usr/bin/start-nginx.sh
COPY ./index.html /opt/app/index.html
COPY ./grid_style.css /opt/app/css_drafts/grid_style.css

EXPOSE 8080
WORKDIR /opt/app
# Angular
# COPY --from=0 --chown=nginx /app/dist/ .
# React
# COPY --from=0 /app/build .
# VueJS
# COPY --from=0 /app/dist .
RUN chmod -R a+rw /opt/app
#USER nginx
USER root 
ENTRYPOINT [ "start-nginx.sh" ]

