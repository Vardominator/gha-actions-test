#!/bin/bash

# prepare signer delegation key
echo $NOTARY_SIGNER_DELEGATION > /tmp/encoded.key
cat /tmp/encoded.key | base64 --decode > /tmp/${NOTARY_SIGNER_DELEGATION_HASH}.key
chmod 600 /tmp/${NOTARY_SIGNER_DELEGATION_HASH}.key

# add signer
cp /tmp/${NOTARY_SIGNER_DELEGATION_HASH}.key ~/.docker/trust/private/
docker trust key load ${NOTARY_SIGNER_DELEGATION_HASH}.key --name ${SIGNER_NAME}

# build
# ...
sleep 2s

docker trust sign ${IMAGE_REPOSITORY}:${IMAGE_TAG}

# push
# ...

# cleanup
# rm /tmp/encoded.key /tmp/decoded.key
