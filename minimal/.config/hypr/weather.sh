#!/bin/bash

curl -s "wttr.in/Warsaw?format=1" | awk '{print $2}' | sed 's/+//'
