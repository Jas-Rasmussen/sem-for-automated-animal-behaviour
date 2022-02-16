#How to develop a buffered evaluation data for the buffered leave block out method in R?

#This script is useful when you want to evaluate the consequences of temporal dependence in the computer
#vision tracking data.

#Use this script to develop a 30 min buffered evaluation data to use for SEM prediction. 


#Step 1: Load libraries
library(readr)
library(tidyverse) 

#Step 2: Read raw fish tracking dataset
#scale all variables that are numeric in the dataset
#Using raw moses perch dataset
data <- read_csv("https://www.dropbox.com/s/mzfrkvdfcv4kex6/dat_mose_final.csv?dl=1") %>%
  mutate(across(where(is.numeric),scale))

#Step 3: Assign the time for the evaluation buffer 
#We used 30 minutes because it provides sufficient fine-scale movement data for ecological research and actions
time_interval <- 0.5/attr(data$time, "scaled:scale") 

#Step 4: Select 50 random tracks or blocks as an evaluation dataset.
dat_in <- expand.grid(idatapoint = sample(1:nrow(data), 50))


#Step 5: Create a function that picks a random evaluation data point and creates a 30 minute buffer around it. The function
#will generate row ids that the will be selected from the raw dataset to generate the evaluation dataset. 

loo_buffer <- function(dat, time_var, iholdout, time_interval = 1){
  #Inputs
  # dat: original scaled data
  #iholdout: row of data that will be the LOO
  #time_interval: interval of time for the LOO buffer. scaled interval. 
  #returns cell numbers that are the LOO and the buffer
  
  #create day_time
  dat$day_time<-substr(dat$filename,4,11)
  
  #select times and days
  times <- dat[time_var]
  date <- dat["day_time"]
  
  #determine the dates of the iholdout
  date2 <-date[c(iholdout),]
  
  mintime <- times[c(iholdout),] - (time_interval/2) #select min times
  maxtime <- times[c(iholdout),] + (time_interval/2) #select max times
  
  
  irm2 <- which(times > as.vector(mintime[['time']]) & times < as.vector(maxtime[['time']]) & date==date2[['day_time']])
  
  return(irm2)
}

#Step 6: Generate the buffered evaluation data.
#Note that we repeated the process for every of the 50 blocks (using lapply etc). In this example we show how to run loo_buffer
#when only using row 10 as the random data point. 
evaluation_data<-data[loo_buffer(dat=data,time_var="time",iholdout=10, time_interval=time_interval),]









