#!/bin/bash
git fetch origin development
git reset --hard FETCH_HEAD
git pull
