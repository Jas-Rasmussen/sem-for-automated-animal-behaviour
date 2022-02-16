#How to add time covariates to automated fish tracking data?

#This script is useful when you are working with computer vision tracking data for ecology
#and you are expecting that 'time' has a non-linear effect on the latent behavioural state
#(e.g., unobserved fish behaviour)

#An example of a non-linear effect on the latent behavioural state is when fish foraging
#is more likely in the morning and evening. Therefore, fish foraging behaviour is not
#expected to increase linearly with time


#Step 1: Load libraries
library(tidyverse) 
library(lubridate)
library(splines)

#for data viz
#library(ggplot2) #plotting
#library(patchwork) #layout
#library(ggthemes) #aesthetics
library(semPlot) #sem plotting tool
library(corrplot) #corr plotting tool

#for sem modelling
library(lavaan) 

#Step 2: Load data
#We are reading the 1 min buffered dataset for moses perch. Please see ___ on how to obtain this dataset
#The data has already mean centered and scaled all the numerical variables such as time, spatial angle or speed
buff_mose<-read.csv('https://www.dropbox.com/s/p138pj5xg9aksc4/1min_buffered_mose.csv?dl=1')#


#Step 3: Specify the SEM 
#We specify the model without the time splines, ensure that trait ~... is the last term as the splines will be pasted at the end

mod<- "
  trait1 =~ spatial_angle + spatial_speed + detection_depth + sinuosity
  trait1 ~ tide+distance_to_pipe"

# Step 4: Define the degrees of freedom for the spline
#We used >3 but <9 as some models were not identified outside this range
splines_ndf <- expand.grid(ndf = c(3,4,5,6,7,8,9))


# Step 5: Develop a function that runs an SEM model for every spline ndf
fit_spline_sem_short <- function(dat, ndf, var, model){
  #Inputs
  #dat - a dataframe
  #ndf: degrees of freedom for the spline. obtained from splines_ndf
  #var: continuous variable to apply the spline to (e.g., time)
  #model: model as a character string, note spline comment in line 34
  
  ncs <- ns(dat[,var], ndf) #create spline design matrix 
  #cbind splines onto the end of the dataframe
  ncsdat <- data.frame(ncs)
  names(ncsdat) <- paste0("spline", names(ncsdat))
  
  #remove non-numeric variables
  dat2 <- cbind(dat, ncsdat) %>%
    transmute(across(where(is.numeric)))
  #Covariance matrix, with splines 
  dat_cov<-cov(dat2, use="pairwise.complete.obs")
  
  # modify model formula to include splines 
  mod_cs <- paste(model, paste0(rep("+splineX", ndf), 
                                1:ndf, collapse = " "))
  #Fit the SEM
  mod_fit <- sem(mod_cs, data = dat2, 
                 sample.cov = dat_cov)
  #Generate summary
  smod <- summary(mod_fit)
  
  #Generate plot
  plot<-semPlot::semPaths(mod_fit, what='est', residuals=F)
  
  return(list(mod_fit = mod_fit, plot=plot))
}

#Step 6: Run the function and see the results
#mose_sem is a list that includes a sublists for every SEM run of each spline ndf. Plots are shown in the Plots console in R but also stored
#in the sublists. 
mose_sem<-lapply(1:nrow(splines_ndf),
                 function(x){fit_spline_sem_short(buff_mose,splines_ndf$ndf[x],"time",mod)})



