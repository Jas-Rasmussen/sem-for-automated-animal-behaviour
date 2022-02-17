# Structural Equation Models for Automated Animal Behaviour Analyses
[![Powered by](https://img.shields.io/badge/Powered%20by-FishID-green)](https://globalwetlandsproject.org/tools/fishid/)
![Status](https://img.shields.io/badge/Status-In%20Development-orange)
[![Supported by](https://img.shields.io/badge/Supported%20by-AIForEarth-orange)](https://www.microsoft.com/en-us/ai/ai-for-earth)

# Table of Contents
1. [Summary](#summary)
2. [Dataset](#dataset)
3. [Computer Vision Model](#computer-vision-model)
4. [Behavioural Indicators](#behavioural-indicators)
5. [How to build a SEM?](#how-to-build-a-sem)
6. [Methods for time decomposition](#methods-for-time-decomposition)
7. [Methods to generate a buffered evaluation data](#methods-to-generate-a-buffered-evaluation-data)
8. [Raw tracking datasets](#raw-tracking-datasets)

## Summary
This repository shows how to develop structural equation models (SEM) using computer vision fish tracking data. We show how to translate raw movement data into ecological insight. 

## Dataset
90 hours of underwater were collected in a piped tidal weir in Australia. Raw videos can be provided upon request. 

## Computer Vision Model
We used [FishID](https://globalwetlandsproject.org/tools-2__trashed/fishid/), a platform developed by Griffith University to automatically detect and track fish.

## Behavioural Indicators
From the computer vision model we extracted the following indicators
  - spatial angle: movement angles in degrees.
  - spatial speed: pixel/miliseconds between detection x and detection y.
  - detection depth: y coordinate of a detection and an indicator of depth.
  - sinuosity: numerical index that measures degress of undulation. Obtained from the [_trajr_](https://www.google.com/search?q=trajr&oq=trajr&aqs=chrome..69i57.1104j0j7&sourceid=chrome&ie=UTF-8) package in R. 

## How to build a SEM?
We recommend reading this chapter on [latent variable modelling](https://jslefche.github.io/sem_book/latent-variable-modeling.html).

## Methods for time decomposition
We decomposed our linear time variable, see "time" on the reference dataset, to capture non-linear relationships between our latent behavioural state and time.For details see the time_decomposition.R

In the time_decomposition.R script we show how to run a SEM for every time spline.

## Methods to generate a buffered evaluation data
In our cross-validation routine we randomly selected 50 tracks or blocks as an evaluation dataset. For every block we created a 30 min buffer. We predicted against each track or block in the evaluation dataset. For details on how to generate the buffered evaluation data see bufferred_leave_block_out.R

## Raw tracking datasets
To access our raw tracking datasets please see
  - [Moses perch](https://www.dropbox.com/s/mzfrkvdfcv4kex6/dat_mose_final.csv?dl=0)
  - [Southern herring](https://www.dropbox.com/s/hov669jacfmtn65/dat_herr_final.csv?dl=0)
  - [Yellowfin bream](https://www.dropbox.com/s/81jo7iag7tgjqd8/dat_bream_final.csv?dl=0)

These datasets have been curated, wrangled and post-processed and not represent the raw tracking outputs from FishID. 

Each csv contains the following columns
  - _filename_: a concatenated string that contains camera id, day, start time of recording, and site
  - _time_: detection time in decimals
  - _species_: common name of the species detected at a given time
  - _spatial_angle_: movement angle in degrees
  - _tracker_id_: tracker id 
  - _tracker_length_: original length of tracker before any detection post-processing. Recommend not using this value. 
  - _detection_depth_: y coordinate of the fish detection 
  - _detection_length_: x coordinate of the fish detection
  - _spatial_dist_: distance in pixel between detection 1 and detection 2 of tracker_id
  - _spatial_speed_: value of detection speed in pixel by milisecond
  - _site_: all data collected at Twin Waters, Queensland
  - _tide_: tide value in m for every hour of data collection
  - _tide_type_: ebb, flow, low, or high
  - _camera_location_: location of camera in the fish passageways. Interpret as 'close' to the pipe entrance
  - _spatial_angle_simple_: categorical variable of movement, either movement to the left, right, up or down. 
  - _sinuosity_: numerical index of track curvature. a higher value means more curved. 
  - _distance_to_pipe_: numerical variable to represent camera_location. Units - metres. 
  
  
  
  
