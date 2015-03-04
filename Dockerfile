#
# Sets up and Runs my ghost blog in a container
#

# Base image
FROM node:0.10

RUN apt-get update 
RUN apt-get install -y unzip

# Install everything
RUN \
 cd /tmp && \
 wget https://github.com/domluna/ghost-blog/archive/master.zip && \
 unzip master.zip -d /ghost && \
 rm -f master.zip && \
 cd /ghost && \
 mv ghost-blog-master/* . && \
 rm -rf ghost-blog-master && \
 npm install && \
 useradd ghost --home /ghost

# Set environment to production
ENV NODE_ENV production

# Change to ghost directory
WORKDIR /ghost

# default command
CMD ["npm", "start"]

# Expose ports
EXPOSE 2368
