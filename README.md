Human Activity Recognition with Mobile Sensors
==============================================

This project aims at learning and classifying human activity recorded by multiple mobile accelerometers equally spread on both arms, using the Activity Recognition Dataset "Skoda Mini Checkpoint" (see description.html for more info).

In combination with another team aiming at performing Feature Selection through LDA and PCA on the same data this project aims at establishing a strong baseline evaluation that will challenge the Feature Selection methods thoroughly. The baseline evaluation also include studies of which activities that improve the most and the least with the deeper Feature Selection methods.

Further studies include the iterative process of including 10%, 20%, 30% .. data to study the neccesity of data amount to establish a useful classification model looking at which activities require more data and less to be determined with a high success.

Current Data: 
=============
- left - Only left arm sensors
- right - Only right arm sensors
- all (All 30 sensors (10x (x,y,z)) combining the above data sets

Only using raw data from original set

Current feature extraction method: Sliding window
=================================================
- length = 64
- overlap = 50%

Current features for each sensors: 
==================================
- Mean 
- Std.dev.

To perform pre-processing of data set run:
> skodaGenerateProcessedData

Resulting .mat-files:
=====================
- _data_raw.mat (contains all extracted data from data set for left, right and combined)
- _data_procd.mat (contains the preprocessed result of the raw data)

A fixed data set generated by this process is established in EstablishedDataForBaseline folder

Baseline kNN (10-fold Cross-Validation):
========================================
- Both:     0.941187418574353
- Left:     0.920018365472911
- Right:    0.907796917497734

Activity evaluation is done through establishing confusion matrices for each evaluation.
