#!/bin/bash

ergo k8s init --km 11.11.11.11  --kw 11.11.11.12  --kpass vagrant

ergo ops exec kubectl get node --ip 11.11.11.11 --pass vagrant

ergo helm install metallb --ip 11.11.11.11 --pass vagrant

ergo helm install nginx-ingress-controller  --ip 11.11.11.11 --pass vagrant

ergo ops exec "kubectl get services -o wide --all-namespaces | grep --color=never -E 'LoadBalancer|NAMESPACE'" --ip 11.11.11.11 --pass vagrant
