#!/bin/bash
while read -r in || [ -n "$in" ]; do
    go get "$in";
done