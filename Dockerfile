FROM nginx:alpine

# Remove existing Nginx default files
RUN rm -rf /usr/share/nginx/html/*

COPY templatemo_499_catalyst/ /usr/share/nginx/html/

# Change ownership to the nginx user and group
RUN chown -R nginx:nginx /usr/share/nginx/html/

# Ensure proper read permissions for files and directories
# (755 for directories, 644 for files - this handles both recursively)
RUN find /usr/share/nginx/html/ -type d -exec chmod 755 {} \;
RUN find /usr/share/nginx/html/ -type f -exec chmod 644 {} \;
# Or simpler, if you just want general read/exec for all:
# RUN chmod -R 755 /usr/share/nginx/html/
# The find commands are more precise if you want stricter file permissions
# but for web content, 755 recursive is often fine.