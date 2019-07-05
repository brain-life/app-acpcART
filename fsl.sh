#!/bin/bash

set -e
set -x

if [ $(jq -r .reorient config.json) == true ]; then
	echo "running fslreorient2std"
	fslreorient2std t1.nii.gz t1.nii.gz
fi

if [ $(jq -r .crop config.json) == true ]; then
	echo "cropping neck"
	robustfov -i t1.nii.gz -r t1.nii.gz
fi

