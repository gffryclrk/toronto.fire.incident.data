# Mining Toronto Fire Services Incident Data

CKME 136 Capstone Project

By Geoffrey Clark

## Overview

The goal of this project is to mine the Open Toronto Fire Services Incident Data which has been published on the Toronto Open Data Catalogue. Any patterns or discoveries are reported upon, however, the ultimate goal is some form of predictive model which will be able to classify incidents based on data that is available at initial call time via Computer Aided Dispatch or other Incident Monitoring processes. 

This project was undertaken and completed as a submission for Ryerson University's [CKME136](https://ce-online.ryerson.ca/ce/calendar/default.aspx?id=5&section=course&mode=course&ccode=CKME%20136) which is a requisite for the [Big Data Analytics and Predictive Analytics Certificate](https://ce-online.ryerson.ca/ce/calendar/default.aspx?section=program&sub=cert&cert=DATANA00&mode=program). The goal of the project, beyond completing the course, was to conduct an exploratory data analsys to discover initial patterns followed by a modeling phase where a dependent variable was predicted using various machine learning algorithms. The dependent variable chosen was created using various thresholds which were influenced by relevant research and the classifiers used were Logistic Regression, Naive Bayes and Random Forest. Some notes are provided below, however, a final report summarizing the project is available [here](https://github.com/gffryclrk/toronto.fire.incident.data/blob/master/docs/finalReport.tex.pdf).

The final presentation was delivered in the evening of Wednesday, August 8th, 2018 in the Victoria Building of Ryerson University to an audience of approximately 12 people. 
## Timeline & Deliverables

Below were the relevant dates for this project. All submissions were completed on time.

|Date|Objective|Deliverable|
|---|---|---|
|21 May 2018|Project abstract|A Word or PDF document|
|11 June 2018|Literature Review, data description and approach|A Word or PDF Document|
|09 July 2018|Initial Results and the Code|Discuss by meeting with the supervisor|
|30 July 2018|Final results and the project report|A Word of PDF Document|
|06 - 10 August 2018|Final Presentations|To be done in a classroom|

## The Data

The data used in this project was the Toronto Fire Services Incident Data published on the Toronto Open Data Catalog. The data set was published as XML and, initially retrieved in May 2018, contains incident and responding unit data pertaining to approximately 720,000 Fire Services Incidents which occurred between the years of 2011 and 2016. In order to better explore the data the nested XML structure is converted to tabular .csv documents and imported into an R data.frame. All relevant code used to transform the data is available in this repository.

Tools Used:
* XQuery
* Bash Scripting
* R

## Initial Analysis

The initial analysis for this project was primarily concerned with understanding the 100 features of the dataset, their types, missing values, proportions and associated graphics. Further features were created using existing features such as Time-to-arrival (difference in time between initial call and on-scene time), and groupings of categorical features with many levels (property, event & response types). Relationships among the features are also explored using statistical methods and data mining techniques. 

Tools Used:
* Statistical test: Chi-square test of independence (Pearson)
* Association Rules (Apriori)
* R Packages:
    * base
    * stats
    * ggplot2
    * tidyverse
    * arules

## Initial Results

The initial results contained some association rules as well as performance of Logistic Regression and Naive Bayes. Although this portion of the project is mentioned in the final report more detailed observations are available in [dataNotes.odf](https://github.com/gffryclrk/toronto.fire.incident.data/blob/master/docs/dataNotes.pdf). Most of R code used to create these results, including significant amounts of cleaning and preparation, are available in [dataPrep.Rmd](https://github.com/gffryclrk/toronto.fire.incident.data/blob/master/r/DataPrep.Rmd). 

## Final Results

As recommended by Dr. Ceni Babaouglu, the final approach for this project was to use an additional classifier, Random Forest, and run all three models 10 times on random training and test sets while recording the results. Finally, a one-way ANOVA was run on relevant evaluation metrics to test for statistically significant differences between models. The ANOVA showed that the differences were highly significant. These findings are available in the [Final Report](https://github.com/gffryclrk/toronto.fire.incident.data/blob/master/docs/finalReport.tex.pdf). 
## Further Objectives

I was quite satisfied with the results of this project. I was able to apply much that I learned while studying in the Data Science Lab at Ryerson and improved tremendously with technical skills, such as R and various packages, as well as in analyzing results in general. Dr. Babaouglu was great to work with and provided excellent assistance and guidance at all stages of this project. As I learn new concepts in Data Science it is likely that I will revisit this dataset, already prepared and familiar, to experiment with and test new concepts. There is still a wealth of information that can be derived by mining Toronto Fire Services incidents.

