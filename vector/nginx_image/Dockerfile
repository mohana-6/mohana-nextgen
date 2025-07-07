FROM nginx:alpine
RUN apk add --no-cache \
    aws-cli \
    groff \
    less
    
# Set entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]