# Use official Alpine release
FROM alpine:latest as build

# Maintainer
LABEL maintainer="Björn Gernert <mail@bjoern-gernert.de>"

# Change working dir
WORKDIR /root

# Update apk
RUN apk update

# Install buildtools
RUN apk add --no-cache git g++ go make

# Get Smugmug backup tool
RUN git clone https://github.com/tommyblue/smugmug-backup.git

# Apply the 'smart_gallery' patch
COPY smart_gallery.patch /root/smugmug-backup/
RUN cd /root/smugmug-backup/ && \
    git config --global user.email "mail@example.com" && \
    git config --global user.name "Max Mustermann" && \
    git am < smart_gallery.patch && \
    make build && \
    mv smugmug-backup /usr/bin/smugmug-backup

# Copy config file
RUN mkdir /root/.smgmg/
COPY config.toml /root/.smgmg/

# Export volumes
VOLUME /backup

# Start Smugmug backup
CMD ["sh", "-c", "/usr/bin/smugmug-backup"]
