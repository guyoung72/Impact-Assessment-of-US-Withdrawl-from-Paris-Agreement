install.packages("tidyverse","readxl")
install.packages("devtools")

library(tidyverse)
library(readxl)
devtools::install_github("edunford/tidysynth")
require(tidysynth)

setwd("C:/Users/Guyoung/Desktop/dataset")
data1 = read_excel("merged_data.xlsx")
attach(data1)

data1 %>% dplyr::glimpse()


# Our Y (outcome) = crude oil production per day (in 1k barrels per day)
# Our betas (covariates):
# Beta 1 = gdp per capita (in US$)
# Beta 2 = population
# Beta 3 = cpi change % (inflation %)
# Beta 4 = renewable energy % (What % of their energy is from renewable energy sources)
# Donor pool = Canada, Russia, Saudi Arabia


data1_out <-
  
  data1 %>%
  
  # initial the synthetic control object
  #2017=> Trump announced US would cease all participation in the Paris Agreement
  #2020=> US officially left the Paris Agreement
  synthetic_control(outcome=oil_day,
                    unit=country,
                    time=year,
                    i_unit="United States",
                    i_time=2017,
                    generate_placebos = T) %>%
  
  # Generate the aggregate predictors to fit the weights
  
  # gdp per capita, inflation, and population
  # between 1998-2017
  generate_predictor(time_window=1998:2010,
                     gdpcap=mean(gdp_cap, na.rm=T),
                     pop=mean(popul,na.rm=T),
                     cpi_=mean(cpi, na.rm=T),
                     natgas=mean(`natgas_year (Billion cubic feet)`,na.rm=T))%>%
  
  
  generate_predictor(time_window = 1998:2010,
                     renew=mean(re_eng,na.rm=T))%>%
  
  generate_predictor(time_window = 2008,
                     oil_p2008 = oil_day) %>%
  generate_predictor(time_window = 2010,
                     oil_p2010 = oil_day) %>%
  generate_predictor(time_window = 2014,
                     oil_p2014 = oil_day) %>%
  # average renewal energy percentage in the donor pool from 1998-2017

  
  # lagged oil production
  # lag part need to be included
  # Lagged oil production
  
  # generate the fitted weights for the synthetic control
  generate_weights(optimization_window = 1998:2017, # time to use in the optimization task
                   margin_ipop = .05,sigf_ipop = 7,bound_ipop = 7) %>%
  
  # generate the synthetic control
  generate_control()


data1_out %>% plot_trends()

data1_out %>% plot_differences()

data1_out %>% plot_weights()

data1_out %>% grab_balance_table()

data1_out %>% plot_placebos()
