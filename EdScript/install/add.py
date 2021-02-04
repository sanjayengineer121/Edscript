#!/usr/bin/python

from os import system

commands = [
    "echo '# Kali linux repositories",
    "deb http://http.kali.org/kali kali-rolling main contrib non-free",
    "apt-get update -m"
]

for i in commands:
    system(i)
