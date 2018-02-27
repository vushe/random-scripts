#!/bin/sh

sudo locale-gen "fi_FI.UTF-8"
sudo apt install language-pack-fi language-pack-gnome-fi language-pack-fi-base language-pack-gnome-fi-base

LC_ALL=fi_FI.UTF-8
LANG=fi_FI.UTF-8
LANGUAGE=fi_FI.UTF-8

gnome-terminal
