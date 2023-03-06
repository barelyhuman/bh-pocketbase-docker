#!/bin/bash

url=$(curl -sL https://api.github.com/repos/pocketbase/pocketbase/releases | jq '.[] | select ( .tag_name | contains("v0.13.1") ) | .assets | .[] | select ( .browser_download_url | contains("linux_amd64") ) | .browser_download_url')
echo $url | xargs curl -L -o ./pocketbase.zip
unzip ./pocketbase.zip

