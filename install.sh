#!/usr/bin/env bash

# Install Contour so we have an Ingress to get to.
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

# Install MySQL & Wordpress
kubectl apply -k setup/

echo "Waiting for the LB address"
sleep 60

# get the Contour load balancer IP
export LB_ADDRESS="http://"$(kubectl get -n projectcontour service envoy -o jsonpath="{.status.loadBalancer.ingress[0].ip}")

say "Done installing Contour and Word press"

echo "\n\n"
echo $LB_ADDRESS
