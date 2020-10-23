#!/bin/bash

ergo k8s init --km 11.11.11.11  --kw 11.11.11.12  --kpass vagrant

ergo vm exec kubectl get node --ips 11.11.11.11 --pass vagrant

ergo helm install metallb --ip 11.11.11.11 --pass vagrant

ergo helm install nginx-ingress-controller  --ip 11.11.11.11 --pass vagrant

ergo vm exec "kubectl get services -o wide --all-namespaces | grep --color=never -E 'LoadBalancer|NAMESPACE'" --ips 11.11.11.11 --pass vagrant
