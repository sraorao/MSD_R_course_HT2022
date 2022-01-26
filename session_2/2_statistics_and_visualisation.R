###R for biologists
##Irina & Rao, 26/01/2022

#### LOAD and PREPARE data ####
# We will load and subset migration and morphology data as in session 1

# Load migration data
# We are only interested in columns 8, 9, 10, 13
# We are also NOT interested in rows 1, 2
migration_data = read.csv("session_1/data/AID_1159618_datatable_all.csv")
migration_data = migration_data[c(-1, -2), c(8, 10, 13)]
colnames(migration_data) = c("reagent_id", "gene_symbol", "migration")
dim(migration_data)
head(migration_data)

# Load morphology data
# We are only interested in columns 8, 10, 19, 59
# NOTE: we are reading column 59 in addition this time
# We are also NOT interested in rows 1, 2
morphology_data = read.csv("session_1/data/AID_1159617_datatable_all.csv")
morphology_data = morphology_data[c(-1, -2), c(8, 10, 19, 59)]
colnames(morphology_data) = c("reagent_id", "gene_symbol", "elongatedness", "cluster")
dim(morphology_data)
head(morphology_data)

#### MERGE migration and morphology data ####
migmorph = merge(migration_data, morphology_data, 
                          by = c("reagent_id", "gene_symbol"), all = TRUE)
colnames(migmorph)
head(migmorph)
str(migmorph)

migmorph$migration = as.numeric(migmorph$migration)
migmorph$elongatedness = as.numeric(migmorph$elongatedness)



#### Statistics ####
summary(migmorph)
mean(migmorph$migration)
median(migmorph$migration)

# T test
# Filter the data based on the cluster column and perform a t test 
# between clusters 1 and 6
# Do the above using split() (needs List?)
migmorph_cl1 = migmorph[migmorph$cluster == "1", ]
migmorph_cl6 = migmorph[migmorph$cluster == "6", ]
t.test(migmorph_cl1$elongatedness, migmorph_cl6$elongatedness)

# Q: Perform a T test with Welch correction
# hint: look up the help for t.test()


wilcox.test(migmorph_cl1$elongatedness, migmorph_cl6$elongatedness)

# Calculate Pearson's correlation coefficient

cor.test(migmorph$migration, migmorph$elongatedness)
# Q: Calculate Spearman correlation coefficient
# # hint: Look up the help pages for cor.test() function


#### Basic visualisation ####

hist(migmorph$migration) 
hist(migmorph$migration, breaks = 10)

plot(density(migmorph$migration))

plot(migmorph$migration, migmorph$elongatedness)

# add colours
plot(migmorph$migration, migmorph$elongatedness, col=migmorph$cluster)

# Add a main title

# Change x and y labels


