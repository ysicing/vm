#!/bin/bash

ergo vm init --pass vagrant --ips 11.11.11.11 --ips 11.11.11.12

ergo vm install docker --pass vagrant --ips 11.11.11.11 --ips 11.11.11.12

vagrant snapshot save initstatus

ergo vm exec docker ps --ips 11.11.11.11 --ips 11.11.11.12 --pass vagrant