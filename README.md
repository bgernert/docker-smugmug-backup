# Smugmug Backup Container

## Goal of this image

This image provides the smugmug backup tool in a Docker container.

Credit goes to: Tommaso Visconti <https://github.com/tommyblue/smugmug-backup>

##### Skipping smart galleries

In addition to the original backup tool, you can skip the download of smart galleries by adding the keyword `smart_gallery` to the smart gallery.

## How to use the image

```
docker build -t docker-smugmug-backup .
docker run -d \
  -e "API_KEY=<key>" \
  -e "API_SECRET=<secret>" \
  -e "USER_TOKEN=<token>" \
  -e "USER_SECRET=<secret>" \
  -e "USER_NAME=<smugmug-username>" \
  -v /backup:/path/on/host \
  docker-smugmug-backup
```
