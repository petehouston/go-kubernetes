# go-kubernetes

Build Go app with one of following options:

```
// 1. Manually
$ go build main.go

// 2. Docker build
$ docker build -t NAME .
```

Start clusters (pods) using Kubernetes and minikube.

```
$ minikube start
$ kubectl apply -f k8s-deployment.yml
$ minikube service go-kubernetes --url
http://10.17.28.112:32110
```

**NOTE**: `minikube` starting with `hyperkit` VM driver will create default VM with 2 CPUs and 20GB.

Open the output URL via browser to test Go service.

To clean up

```
$ kubectl delete service go-kubernetes-service
$ kubectl delete deployment go-kubernetes
$ minikube stop
$ minikube delete
```