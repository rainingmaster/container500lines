#!/bin/bash

make clean && \
	make $1 && \
	echo && \
	sudo ./contained -m $(pwd)/jail -u 0 -c /bin/sh
