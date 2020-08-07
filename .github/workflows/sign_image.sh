#!/bin/bash

# prepare signer delegation key
echo $NOTARY_SIGNER_DELEGATION > /tmp/encoded.pub
cat /tmp/encoded.pub | base64 --decode > /tmp/decoded.pub
chmod 600 /tmp/decoded.pub

# add signer
docker trust signer add --key /tmp/decoded.pub ${SIGNER_NAME} ${IMAGE_REPOSITORY}

# build
# ...

docker trust sign ${IMAGE_REPOSITORY}:${IMAGE_TAG}

# push
# ...

# cleanup
rm /tmp/encoded.pub /tmp/decoded.pub
