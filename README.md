# A framework to understand animal behaviour when using Artificial Intelligence data 
[![Powered by](https://img.shields.io/badge/Powered%20by-FishID-green)](https://globalwetlandsproject.org/tools/fishid/)
![Status](https://img.shields.io/badge/Status-Completed-green)
[![Supported by](https://img.shields.io/badge/Supported%20by-AIForEarth-orange)](https://www.microsoft.com/en-us/ai/ai-for-earth)

# Table of Contents
1. [Objectives](#objectives)
2. [Dataset](#dataset)
3. [Automated Processing of Videos](#automated-processing-of-videos)
4. [Behavioural Framework](#behavioural-framework)
5. [Cross-Validation Routine](#cross-validation-routine)

## 📍Objectives
 Movement studies provide essential ecological insights and aid in conservation efforts. Fine-scale movement data helps identify rare behaviors, usage of habitats, and importance of protected areas. Automated and remote techniques (such as Artificial Intelligence) enable the collection of fine-scale movement data from underwater imagery. However, translating raw movement data into ecologically relevant metrics remains a challenge.

 In this repository, you will find a framework to classify fish behaviour and show how it can be used to predict behavioural events from large datasets. 

### Behavioural events
Behavioural events can be defined in several ways, but in this repo, an event is a behaviour that occurs in a short period and is measured when an animal is detected and tracked in the cameras's FOV. 

## 📍Dataset
90 hours of underwater videos were collected in [piped tidal weirs](https://www.fws.gov/story/anatomy-fish-weir#:~:text=Weirs%20help%20us%20to%20establish,and%20forecast%20future%20salmon%20returns) in southeast Queensland, Australia. Underwater cameras recorded all fish swimming across the weirs from 7AM to 4PM. Videos were recorded across three sites, over three sampling dates. 

## 📍Automated processing of videos
[FishID](https://globalwetlandsproject.org/tools-2__trashed/fishid/), was used to automatically detect and track fish.

To access our raw tracking datasets please see
  - [Moses perch](https://www.dropbox.com/s/mzfrkvdfcv4kex6/dat_mose_final.csv?dl=0)
  - [Southern herring](https://www.dropbox.com/s/hov669jacfmtn65/dat_herr_final.csv?dl=0)
  - [Yellowfin bream](https://www.dropbox.com/s/81jo7iag7tgjqd8/dat_bream_final.csv?dl=0)
These datasets have been curated, wrangled and post-processed and not represent the raw tracking outputs from FishID. 

Please see [here]() to understand the structure of the datasets

## 📍Behavioural framework
The behavioural framework was built around structural equation models (SEM) because they can capture behavioural events that cannot be directly observed from observed data. Normally, underwater fish tracking data is noisy, complex and non-continous. 

This framework was composed of three data types
- sampling covariates
- environmental covariates
- behavioural indicators

| Name | Type | Description | 
| --- | --- | --- | 
| Camera distance to pipe entrance | Sampling covariate | Numeric variable indicating proximity of the camera to the weir outlet | 
| Tides and Time | Environmental covariates | Hourly tide values and time of detection across videos. See [Time decomposition]() |
| Spatial angle | Behavioural indicators | Numeric variable that indicates the movement angles (degrees) between detection X and detection Y at any given video frames |
| Spatial speed |Behavioural indicators | Numeric variable that indicates the movement speed in pixels per milliseconds of an individual between detection X and detection Y at any given video frames |
| Detection depth | Behavioural indicators | Detection height (y coordinate) as an indicator of depth of the detection. Lower detection height means a detection near the surface whereas a higher detection height means a detection closer to the seafloor |
| Sinuosity | Behavioural indicators | Numerical index that measures the degrees of undulations in a track. Higher sinuosity values mean that there are more undulations in an individual track. |

To read more about the theory of SEMs please see [latent variable modelling](https://jslefche.github.io/sem_book/latent-variable-modeling.html). 


## 📍Cross-validation routine
In our cross-validation routine we randomly selected 50 tracks or blocks as an evaluation dataset. For every block we created a 30 min buffer. We predicted against each track or block in the evaluation dataset. For details on how to generate the buffered evaluation data see [cross_validation]()


  
  
  