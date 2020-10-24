#!/bin/bash

ergo vm init --pass vagrant --ips 11.11.11.11 --ips 11.11.11.12

ergo ops install docker --pass vagrant --ip 11.11.11.11 --ip 11.11.11.12

vagrant snapshot save initstatus

ergo ops exec docker ps --ip 11.11.11.11 --ip 11.11.11.12 --pass vagrant