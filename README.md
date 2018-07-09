# Mining Toronto Fire Services Incident Data
## CKME 136 Capstone Project
By Geoffrey Clark

## Overview

The goal of this project is to mine the Open Toronto Fire Services Incident Data which has been published on the Toronto Open Data Catalogue. Any patterns or discoveries are reported upon, however, the ultimate goal is some form of predictive model which will be able to classify incidents based on data that is available at initial call time via Computer Aided Dispatch or other Incident Monitoring processes. 

## Timeline & Deliverables

This project has been undertaken as a Capstone Project for Ryerson's [https://ce-online.ryerson.ca/ce/calendar/default.aspx?id=5&section=course&mode=course&ccode=CKME%20136](CKME136) and is a requisition for completion of the [https://ce-online.ryerson.ca/ce/calendar/default.aspx?section=program&sub=cert&cert=DATANA00&mode=program](Big Data Analytics and Predictive Analytics Certificate). As this is a University course certain timeframes, deadlines and expectations must be met. Below are some of the important dates of submission. Relevant documents can be found in [https://github.com/gffryclrk/toronto.fire.incident.data/tree/master/docs](/docs). 

|Date|Objective|Deliverable|
|---|---|---|
|21 May 2018|Project abstract|A Word or PDF document|
|11 June 2018|Literature Review, data description and approach|A Word or PDF Document|
|09 July 2018|Initial Results and the Code|Discuss by meeting with the supervisor|
|30 July 2018|Final results and the project report|A Word of PDF Document|
|06 - 10 August 2018|Final Presentations|To be done in a classroom|

## The Data

The data used in this project is the Toronto Fire Services Incident Data published on the Toronto Open Data Catalog. The data set is published as XML and, initially retrieved in May 2018, contains incident and responding unit data pertaining to approximately 720,000 Fire Services Incidents which occurred between the years of 2011 and 2016. In order to better explore the data the nested XML structure is converted to tabular .csv documents and imported into an R data.frame. 

Tools Used:
*XQuery
*Bash Scripting
*R

## Initial Analysis

Initial analysis in this project is primarily concerned with understanding the 100 features of the data set, their types, missing values, proportions and associated graphics. Further features were created using existing features such as Time-to-arrival (difference in time between initial call and on-scene time), and groupings of categorical features with many levels (property, event & response types). Relationships among the features are also explored using statistical methods and data mining techniques. 

Tools Used:
* Statistical test: Chi-square test of independence (Pearson)
* Association Rules (Apriori)
* R Packages:
..* base
..* stats
..* ggplot2
..* tidyverse
..* arules

## Initial Results

The initial results of this project have revealed associations between features including EVENT_GROUP, ALARM_TO_FD, RESPONSE_GROUP, EVENT_GROUP and PROPERTY_GROUP. Somewhat surprisingly no association has yet been found between these features and day of the week or time of day.

## Further Objectives

The predictive modeling portion of this project has yet to be completed. This document will be updated with further results and outcomes once they are available. Feel free to contact the author with any questions, concerns or comments. 

