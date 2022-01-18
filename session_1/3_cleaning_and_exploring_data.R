###R for biologists
##Irina & Rao, 19/01/2022

# Q: Knockdown of which gene causes the cells to migrate the least?


#### Cleaning data ####
?airquality
head(airquality)
airquality$Ozone

which_rows_complete = complete.cases(airquality)
airquality[which_rows_complete, ]

ozone_without_missing = na.omit(airquality$Ozone)


#### FILTERING data ####
# Subsetting by logical vectors comes in handy here
# Knockdown of which genes results in migration > 1?

which_rows_mig1 = migmorph$migration > 1
migmorph[which_rows_mig1, ]

# Knockdown of which genes results in elongatedness < 1.5?

which_rows_elongatedness1.5 = migmorph$elongatedness < 1.5
migmorph[which_rows_elongatedness1.5, ]

#### DETOUR: logical operations - AND OR ####

TRUE & TRUE     # AND
TRUE & FALSE
TRUE | TRUE     # OR
TRUE | FALSE

x = 5
x > 4 & x < 6
x > 4 | x > 6

# Filtering with more than one criterion
migmorph[which_rows_mig1 | which_rows_elongatedness1.5, ]
