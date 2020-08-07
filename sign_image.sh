#!/bin/bash

echo $NOTARY_SIGNER_DELEGATION > /tmp/delegation.pub

docker trust key load /tmp/delegation.pub

ls ~/.docker/trust

rm /tmp/delegation.pub
