#!/bin/bash
echo '
-----------------------------------------------------
                Test directly to web01
-----------------------------------------------------'
curl 192.168.10.10:3000/health --connect-timeout 20

echo '
-----------------------------------------------------
                Test directly to web02
-----------------------------------------------------'
curl 192.168.10.11:3000/health --connect-timeout 20

for i in {1..2}
do
echo '
-----------------------------------------------------
                Test on load-balancer
-----------------------------------------------------'
curl 10.10.10.10/health --connect-timeout 20
done

read