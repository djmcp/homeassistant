#!/bin/bash
cd /srv/docker/hass
HA_VER=$(<.HA_VERSION)
cat .gitlab-ci.yml | /snap/bin/yq w - variables.HA_VERSION $HA_VER | tee temp_gitlab-ci.yml
rm prev_gitlab-ci.yml
mv .gitlab-ci.yml prev_gitlab-ci.yml
mv temp_gitlab-ci.yml .gitlab-ci.yml
git add .gitlab-ci.yml
git commit -m "Update CI current HA Version to $HA_VER [ci skip]"
git push
