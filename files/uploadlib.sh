#!/bin/bash
echo "uploadlib.sh start"
mkdir /home/libs/
echo "pip wheel start"
pip wheel --wheel-dir /home/libs -r /home/requirements.txt
echo "az storage start"
az storage blob upload-batch --account-name stadataservweu1d002 -d 'dbrlib' -s /home/libs/ --sas-token "?sv=2021-06-08&ss=b&srt=co&sp=rwdlacx&se=2022-10-05T01:53:20Z&st=2022-10-03T17:53:20Z&spr=https&sig=cTnW%2FTg56IMTH6Sj7ogMs1qa7dtRbb%2B94ZiTX6fmHmM%3D"
echo "after az storage"