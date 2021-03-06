#!/bin/bash

# Author: 	Shmokk Hanswurst
# Date: 		12/29/12
# Version:	0.1
#
# Description:	Free 4 MacOSX

#################################

# vm_stat
# Mach Virtual Memory Statistics: (page size of 4096 bytes)
# Pages free:                          64700.
# Pages active:                       443716.
# Pages inactive:                     332763.
# Pages speculative:                   14620.
# Pages wired down:                   127102.
# "Translation faults":            131628011.
# Pages copy-on-write:               1408957.
# Pages zero filled:               109712171.
# Pages reactivated:                   62548.
# Pageins:                            365068.
# Pageouts:                            20576.
# Object cache: 13 hits of 161774 lookups (0% hit rate)

VMSTAT_OUTPUT=$(vm_stat)

PAGE_SIZE=$(echo "$VMSTAT_OUTPUT" | head -1 | cut -d " " -f 8)
echo "PAGE SIZE=$PAGE_SIZE"
PAGES_FREE=$(echo "$VMSTAT_OUTPUT" | head -2 | tail -1 | awk '{print $NF}' | cut -d "." -f 1)
echo "PAGES FREE=$PAGES_FREE"
BYTES_FREE=$(( $PAGES_FREE  * $PAGE_SIZE ))
echo "BYTES FREE=$BYTES_FREE"
KILOBYTES_FREE=$(( $BYTES_FREE / 1024 ))
echo "KILOBYTES FREE=$KILOBYTES_FREE"
MEGABYTES_FREE=$(( $KILOBYTES_FREE / 1024 ))
echo "MEGABYTES FREE=$MEGABYTES_FREE"
GIGABYTES_FREE=$(( $MEGABYTES_FREE / 1024 ))
echo "GIGBYTES FREE=$GIGABYTES_FREE"
