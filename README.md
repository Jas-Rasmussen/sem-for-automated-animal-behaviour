# Structural Equation Models for Automated Animal Behaviour
[![Powered by](https://img.shields.io/badge/Powered%20by-FishID-green)](https://globalwetlandsproject.org/tools/fishid/)
![Status](https://img.shields.io/badge/Status-In%20Development-orange)
[![Supported by](https://img.shields.io/badge/Supported%20by-AIForEarth-orange)](https://www.microsoft.com/en-us/ai/ai-for-earth)

# Table of Contents
1. [Summary](#summary)
2. [Dataset](#dataset)
3. [Computer Vision Model](#computer-vision-model)
4. [SEM](#sem)
5. [To Do List](#to-do-list)

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



