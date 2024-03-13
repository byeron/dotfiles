#!/bin/bash

echo $PASSWORD | sudo apt -y install fcitx5-mozc
im-config -n fcitx5
