#!/usr/bin/bash
cat ~/.bashrc > .bashrc_bckup
cat ~/.bashrc > bashrc_temp
cat ~/labexam/bashrc_func.sh >> bashrc_temp
cat bashrc_temp > ~/.bashrc
rm bashrc_temp
