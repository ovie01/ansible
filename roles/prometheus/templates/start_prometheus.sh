#!/bin/bash
cd /opt/prometheus/prometheus-1.4.0.linux-amd64
echo $?

./prometheus -config.file=prometheus.yml
echo  $?
