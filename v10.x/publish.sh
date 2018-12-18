#!/bin/bash

LAYER_NAME=nodejs10

NODE_VERSION=10.14.2

REGIONS='
us-east-1
'

for region in $REGIONS; do
  aws lambda add-layer-version-permission --region $region --layer-name $LAYER_NAME \
    --statement-id sid1 --action lambda:GetLayerVersion --principal '*' --organization-id 'o-yfa7ba86zd' \
    --version-number $(aws lambda publish-layer-version --region $region --layer-name $LAYER_NAME --zip-file fileb://layer.zip \
      --description "Node.js v${NODE_VERSION} custom runtime" --query Version --output text) &
done

for job in $(jobs -p); do
  wait $job
done

