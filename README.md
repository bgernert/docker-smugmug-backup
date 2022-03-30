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
  -e "SMGMG_BK_API_KEY=<API Key>" \
  -e "SMGMG_BK_API_SECRET=<API Secret>" \
  -e "SMGMG_BK_USER_TOKEN=<User Token>" \
  -e "SMGMG_BK_USER_SECRET=<User Secret>" \
  -e "SMGMG_BK_DESTINATION=/backup" \
  -e "SMGMG_BK_FILE_NAMES=<Filename with template replacements>" \
  -v /backup:/path/on/host \
  docker-smugmug-backup
```
