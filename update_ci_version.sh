#!/bin/bash
cd /srv/docker/hass
HA_VER=$(<.HA_VERSION)
cat .gitlab-ci.yml | /snap/bin/yq w - variables.HA_VERSION $HA_VER | tee .gitlab-ci.yml
git add .gitlab-ci.yml
git commit -m "Update HA Version to $HA_VER [ci skip]"
git push
