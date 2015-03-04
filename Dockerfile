# 
# Sets up and Runs my ghost blog in a container
#

# Base image
FROM dockerfile/nodejs

# Fetch the repo & overwrite old version
RUN curl -L https://github.com/domluna/ghost-blog/tarball/master | tar zx
RUN cp -r ghost-blog-master-* ghost
RUN rm -rf ghost-blog-master-*

# Change to ghost directory
WORKDIR /ghost

# Install Ghost and dependencies
RUN npm install

# Main command, start Ghost
CMD npm start 

# Set environment to production
ENV NODE_ENV production

# Expose ports
EXPOSE 2368

