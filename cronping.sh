#!/usr/bin/bash
site=$(cat site.txt)
ping "$site" > "$site".log
