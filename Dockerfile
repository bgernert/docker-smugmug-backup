# Use official Alpine release
FROM alpine:latest as build

# Maintainer
LABEL maintainer="Björn Gernert <mail@bjoern-gernert.de>"

# Change working dir
WORKDIR /root

# Update apk
RUN apk update

# Install buildtools
RUN apk add --no-cache git g++ go

# Get Smugmug backup tool
RUN go get github.com/tommyblue/smugmug-backup

# Apply the 'smart_gallery' patch
COPY smart_gallery.patch /root/go/src/github.com/tommyblue/smugmug-backup/
RUN cd /root/go/src/github.com/tommyblue/smugmug-backup/ && \
    git config --global user.email "mail@bjoern-gernert.de" && \
    git config --global user.name "Björn Gernert" && \
    git am < smart_gallery.patch && \
    go build && \
    mv smugmug-backup /root/go/bin/smugmug-backup

# Export volumes
VOLUME /backup

# Start Radsecproxy
CMD ["sh", "-c", "/root/go/bin/smugmug-backup -user $USER_NAME -destination /backup"]
