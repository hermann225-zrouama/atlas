** Get rancher ui password **
kubectl get secret --namespace cattle-system bootstrap-secret -o go-template='{{.data.bootstrapPassword | base64decode}}{{"\n"}}'

** Get argo ui password **
kubectl -n argocd get secret argocd-initial-admin-secret \
          -o jsonpath="{.data.password}" | base64 -d; echo

** ERASE ALL TERMINATING NS **
NS=$(kubectl get ns | grep Terminating | awk 'NR==1 {print $1}') && [ -n "$NS" ] && kubectl get namespace "$NS" -o json | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/" | kubectl replace --raw /api/v1/namespaces/$NS/finalize -f - || echo "No terminating namespaces found."