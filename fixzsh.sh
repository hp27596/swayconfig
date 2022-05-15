#!/bin/bash
mv ~/.zhistory ~/.zhistory_bad
strings -eS ~/.zhistory_bad > ~/.zhistory
fc -R ~/.zhistory
rm ~/.zhistory_bad
