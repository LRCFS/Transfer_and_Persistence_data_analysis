# Transfer and Persistence Data Analysis

This github repository contains the R analyses for the Transfer and Persistence
publication (see CITATION for full reference):

**"Creation of a Universal Experimental Protocol for the Investigation of Transfer and Persistence of Trace Evidence: Part 2 – Implementation and preliminary data."** _Hervé Ménard, Christian Cole, Roy Mudie, Joyce Klu, Melissa Lawson, Stephanie Green, Stewart Doyle, Emma MacNeillsm Bethany Hamilton, Kelly Sheridan, Niamh Nic Daéid_

The analysis is broken down into three parts:

  * Transfer 
  * Persistence
  * Extensions

Each part analysed the data separately and produced visualisation for use in
the publication.

All the raw count data can be found in the `dat/Counts_data.xlsx` spreadsheet.

## Transfer

The data from each of the 5 independent researchers were cleaned-up, combined and 
represented in summary figures. In the data a transfer experiment is defined as
any count that has a persistence time of 0. All the code is found in the `Transfer.Rmd` 
Rmarkdown document and a pdf representation has been compiled as [Transfer.pdf](Transfer.pdf).

Rmarkdown files can be viewed and run from within a suitable editor such as 
[Rstudio](https://www.rstudio.com). [Tutorials](https://rmarkdown.rstudio.com/lesson-2.html) for working with Rmarkdown files are available.

## Persistence

All data with a persistence time was used for performing the analysis, unless
there were not enough replicates in the study. See `Persistence.Rmd` and 
[Persistence.pdf](Persistence.pdf) for the details.

## Extensions

An analysis comparing different camera settings was performed on the same 
data but with two different camera settings (see paper for details). In the 
Rmarkdown file `Extensions.Rmd` (and compiled as [Extensions.pdf](Extensions.pdf))
the settings data were compared and statistical analysis performed to determine
the amount and signficance thereof any systematic differnces observed.

