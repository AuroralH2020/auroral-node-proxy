ARG ARCH
ARG BASE_IMAGE=nginxinc/nginx-unprivileged 

# BUILD PHASE
FROM $BASE_IMAGE 
USER nginx
# copy nginx connf
COPY --chown=nginx:nginx nginx.conf /etc/nginx/conf.d/default.conf
# LABEL
LABEL maintaner="jorge.almela@bavenir.eu"
LABEL org.opencontainers.image.source=https://github.com/AuroralH2020/auroral-node-proxy

ENTRYPOINT ["/docker-entrypoint.sh"]
# START
EXPOSE 8080
STOPSIGNAL SIGQUIT
USER $UID
CMD ["nginx", "-g", "daemon off;"]