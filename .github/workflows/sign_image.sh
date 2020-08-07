#!/bin/bash

# prepare signer delegation key
echo $NOTARY_SIGNER_DELEGATION > /tmp/encoded.pub
cat /tmp/encoded.pub | base64 --decode > /tmp/decoded.pub
chmod 600 /tmp/decoded.pub

# add signer
docker trust key load /tmp/decoded.pub --name ${SIGNER_NAME}

# build
# ...

docker trust sign ${IMAGE_REPOSITORY}:${IMAGE_TAG}

# push
# ...

# cleanup
rm /tmp/encoded.pub /tmp/decoded.pub
