#!/bin/sh

echo "starting machines"
for i in $(flyctl machines list -q); do
    flyctl machines start $i
done