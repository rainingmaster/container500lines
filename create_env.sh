#!/bin/bash

set -e
#set -x

J=$(pwd)/jail


mkdir -p $J
mkdir -p $J/{bin,lib64,lib}
mkdir -p $J/usr
mkdir -p $J/etc

cd $J

# Users
echo "root:x:0:0:root:/root:/bin/bash" > $J/etc/passwd
cp -v --parents /lib/x86_64-linux-gnu/libnss_files.so.2 /lib/x86_64-linux-gnu/libnss_compat.so.2 $J

# Copy executables.
# /usr/bin/strace -> srace whoami 2>&1 | grep -E '/etc|/lib'
execs=(/bin/sh /bin/bash /bin/ls /usr/bin/whoami)

for i in ${execs[@]}; 
do
	# Copy executale.
	cp -v --parents $i $J;

	# Copy shared library dependencies.
	list=$(ldd ${i} | egrep -o '/lib.*\.[0-9]')
	for j in $list; do cp -v --parents $j $J; done
done
