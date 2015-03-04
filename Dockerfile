# 
# Sets up and Runs my ghost blog in a container
#

# Base image
FROM dockerfile/nodejs

# Fetch the repo & overwrite old version
RUN curl -Lk https://api.github.com/repos/domluna/ghost-blog/tarball/master | tar xz
RUN cp -rl ghost-blog-master ghost
RUN rm -rf ghost-blog-master

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

