##### Library Functions ######

# functions
## Gives count, mean, standard deviation, standard error of the mean, and confidence interval (default 95%).
##   data: a data frame.
##   measurevar: the name of a column that contains the variable to be summariezed
##   groupvars: a vector containing names of columns that contain grouping variables
##   na.rm: a boolean that indicates whether to ignore NA's
##   conf.interval: the percent range of the confidence interval (default is 95%)
summarySE <- function(data=NULL, measurevar, groupvars=NULL, na.rm=FALSE,
                      conf.interval=.95, .drop=TRUE) {
  # New version of length which can handle NA's: if na.rm==T, don't count them
  length2 <- function (x, na.rm=FALSE) {
    if (na.rm) sum(!is.na(x))
    else       length(x)
  }
  
  # This does the summary. For each group's data frame, return a vector with
  # N, mean, and sd
  datac <- ddply(data, groupvars, .drop=.drop,
                 .fun = function(xx, col) {
                   c(N    = length2(xx[[col]], na.rm=na.rm),
                     mean = mean   (xx[[col]], na.rm=na.rm),
                     sd   = sd     (xx[[col]], na.rm=na.rm)
                   )
                 },
                 measurevar
  )
  
  # Rename the "mean" column    
  datac <- plyr::rename(datac, c("mean" = measurevar))
  
  datac$se <- datac$sd / sqrt(datac$N)  # Calculate standard error of the mean
  
  # Confidence interval multiplier for standard error
  # Calculate t-statistic for confidence interval: 
  # e.g., if conf.interval is .95, use .975 (above/below), and use df=N-1
  ciMult <- qt(conf.interval/2 + .5, datac$N-1)
  datac$ci <- datac$se * ciMult
  
  return(datac)
}

## function to convert a (character) vector of 
## numbers into a factor ordered numerically
numericFactorOrder <- function(x) {
  
  u = unique(x)
  new.levels = u[order(as.numeric(u))]
  x = factor(x, levels=new.levels)
  return(x)
  
}

## calc std error
stdErr = function(x) {
  sd = sd(x)
  n = length(x)
  return(sd/sqrt(n))
}

## ggplot themes
mytheme = theme_minimal() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.title = element_text(size = 13, face = "bold"),
        axis.text = element_text(size = 11),
        legend.title = element_blank())

facet_theme = theme_minimal() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.title = element_text(size = 13, face = "bold"),
        axis.text = element_text(size = 11),
        plot.background = element_rect(colour = 'grey'),
        strip.background = element_rect(fill = 'lightblue', colour = 'darkgrey'))


inset_theme = theme_minimal() +
  theme(plot.background = element_rect(fill = 'white', colour = 'white'),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank(),
        axis.title = element_text(size = 8),
        axis.text = element_text(size = 8),
        legend.title = element_blank(),
        legend.position = 'NA')
