#!/bin/bash

# prepare signer delegation key
echo $NOTARY_SIGNER_DELEGATION > /tmp/encoded.key
cat /tmp/encoded.key | base64 --decode > /tmp/decoded.key
chmod 600 /tmp/decoded.key

# add signer
docker trust key load /tmp/decoded.key --name ${SIGNER_NAME}

# build
# ...
sleep 5s

docker trust sign ${IMAGE_REPOSITORY}:${IMAGE_TAG}

# push
# ...

# cleanup
# rm /tmp/encoded.key /tmp/decoded.key
