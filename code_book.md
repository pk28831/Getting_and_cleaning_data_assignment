---
title: "Code_book"
author: "Peter Knapen"
date: "06/21/2015"
output: html_document
keep_md: TRUE
---

# Variables used in the tidy data set

The variables used in the tidy data set are a subset of the raw datat set. The tidy data set can be found in tidy_set.txt.  
The variables used in the this set are derived from the features.txt file:


```{r, echo=FALSE}
print(colNames2)
```

Column 1 describes the subjecNumber, ranging from 1 to 30.
Columns 2 describes the 6 activities:

```{r, echo=FALSE}
print(clean_labels[,2])
```

column 3...68 decribe the other 66 variables, these are a concatation of following parts:
time: stands for a variable in the time domain
freq: stands for a variable in the frequency domain (FFT of time signal)
Body: part of signal which can not be assigned to gravity acceleration, higher freqencies
Gravity: part of signal assigned to gravity (Frequency <0.3 Hz).
Acc: signal from a tri-axial accelerometer.
Gyro: signal from a tri-axial Gyroscope: angular velocity
Jerk: 1st derivative to time for Acc and second derivative to time from Gyro
Magnitude: vectorial sum of X, Y and Z
Mean: mean of the signal
Stddev: standard deviation of the signal
X, Y, Z: 3 mutual perpendicular directions of the signals.

The variables in colums 3..68 are dimensionless (no units), as they are normalised between -1 and +1.
