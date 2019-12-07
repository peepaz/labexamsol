#!/usr/bin/bash
merge(){ echo "" > file3; cat "$1" >> file3; cat "$2" >> file3; }

