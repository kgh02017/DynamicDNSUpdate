# DynamicDNSUpdate

Script to update AWS Route53 record

## Description

This script checks the current public IP and updates AWS Route53 record if IP address change detected.

## Installation

- Copy ddns\_update.sh and domain\_info.dat to /opt/ddns\_update
- Specify configuration properly in /opt/ddns\_update/ddns\_update.conf
- Copy ddns\_update.cron to /etc/cron.hourly

## Author

Taku Izumi
