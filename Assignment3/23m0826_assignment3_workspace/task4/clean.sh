#!/bin/bash

sudo ./conductor.sh stop c1
sudo ./conductor.sh stop c2

sudo rm -rf .containers extras conductor.sh config.sh