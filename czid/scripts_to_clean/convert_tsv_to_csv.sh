#!/bin/bash

# Convert parsed_metadata.tsv to a csv file that is compatible with the czid upload metadata csv
#This is a one-time conversion, so I'm not going to make it a function
{
    head -n 1 parsed_metadata.tsv | tr '\t' ',' | sed 's/,$//'
    tail -n +2 parsed_metadata.tsv | tr '\t' ',' | sed 's/,$//'
} > parsed_metadata.csv

