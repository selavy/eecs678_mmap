#!/bin/bash

echo "Running make clean..."
make clean
echo "Running make..."
make
echo "Running make test..."
make test
totem copy.ogg
