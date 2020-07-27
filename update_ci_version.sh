#!/bin/sh

HA_VER = $(<.HA_VERSION)
cd /srv/docker/hass
cat .gitlab-ci.yml | yq w - variables.HA_VERSION $HA_VER | tee .gitlab-ci.yml
# git add .gitlab-ci.yml
# git commit -m "Update HA Version to $HA_VER [ci skip]"
# git push