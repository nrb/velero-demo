#!/usr/bin/env bash


. demo-magic.sh

function cpe() {
    clear
    pe "$@"
}

function wcl() {
    wait
    clear
}

DEMO_PROMPT="$ "
clear

pe 'kubectl get -n wordpress all'

pe 'kubectl get -n wordpress persistentvolumeclaims'

pe 'kubectl get persistentvolumes'

pe 'velero version'

pe 'velero backup create wp-demo --include-namespaces wordpress --wait'
wcl

pe 'velero backup describe --details wp-demo'
wcl

pe 'kubectl delete ns/wordpress'
pe 'kubectl get -n wordpress all'

pe 'kubectl get persistentvolumes'

pe 'velero restore create wp-restore --wait --from-backup wp-demo'

pe 'velero restore describe --details wp-restore'
wcl


pe 'kubectl get persistentvolumes'
pe 'kubectl get -n wordpress all'
