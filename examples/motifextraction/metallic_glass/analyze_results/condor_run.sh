#!/bin/bash

ls -l
wget --quiet http://proxy.chtc.wisc.edu/SQUID/maldonis/python.tar.gz
wget --quiet http://proxy.chtc.wisc.edu/SQUID/maldonis/ppm3d.tar.gz

tar -xzf python.tar.gz
tar -xzf ppm3d.tar.gz
tar -xzf clusters.tar.gz
rm python.tar.gz
rm ppm3d.tar.gz
rm clusters.tar.gz

# make sure the script will use your Python installation
export PATH=$(pwd)/python/miniconda3/bin:$PATH
export PYTHONPATH=$(pwd)/ppm3d_correct/packages:$PYTHONPATH

# run your script
mv clusters/* ppm3d_correct/analysis/data/clusters/
mv averaged/* ppm3d_correct/analysis/data/averaged/
cd ppm3d_correct/analysis/analyze_results
python align_motif.py $1
python extract_errors.py $1 3.6
