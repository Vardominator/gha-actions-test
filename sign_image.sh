#!/bin/bash

echo $NOTARY_SIGNER_DELEGATION > /tmp/encoded.pub
cat /tmp/encoded.pub | base64 --decode > /tmp/decoded.pub
chmod 600 /tmp/decoded.pub

docker trust signer add --key /tmp/decoded.pub gha_signer 263799606133.dkr.ecr.us-east-1.amazonaws.com/notary/signtest2

ls ~/.docker/trust

# rm /tmp/delegation.pub
