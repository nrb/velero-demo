#!/usr/bin/env bash
# Clean up all artifacts created for the demo besides the cluster and the Velero installation itself

kubectl delete -k setup/ --wait=true

kubectl delete namespace/projectcontour

velero backup delete --all --confirm

say "Done tearing down"
