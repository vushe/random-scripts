#!/bin/bash

url=$1

best_quality="$(youtube-dl -F $url --no-warning | grep '(best)' | grep -Eo '^[0-9]{1,100}\S')"
youtube-dl -f $best_quality $url