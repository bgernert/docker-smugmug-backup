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

# Export volumes
VOLUME /backup

# Start Radsecproxy
CMD ["sh", "-c", "/root/go/bin/smugmug-backup -user $USER_NAME -destination /backup"]
