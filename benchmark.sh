#!/usr/bin/env bash

TIMEFORMAT="%E"

for i in {1..100}; do
	time ./fin fin.cfg
done
