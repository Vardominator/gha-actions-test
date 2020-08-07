#!/bin/bash

echo $NOTARY_SIGNER_DELEGATION > /tmp/delegation.pub
cat /tmp/delegation.pub | tr ' ' '\n'
chmod 600 /tmp/delegation.pub

docker trust signer add --key /tmp/delegation.pub gha_signer 263799606133.dkr.ecr.us-e

ls ~/.docker/trust


# rm /tmp/delegation.pub
