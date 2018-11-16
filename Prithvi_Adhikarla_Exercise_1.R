#
# R-assignment. Week-1. Exercise-1
# Name: Prithvi Adhikarla
# Team: MYMOVE
#
myName <- "Prithvi A"
print(myName)
print(class(myName))

# Create a variable called mtcarsColumns that contains a character vector of the column names from `mtcars`.
# NOTE: I was unable to name the car name column; so to circumvent, I did export-import and then was able to rename.
# I am sure there is a better way.
write.csv(mtcars, file = "mtcars.csv")
mtcars_csv_imported <- read.csv(file="mtcars.csv", header=TRUE, sep=",")
colnames(mtcars_csv_imported)[colnames(mtcars_csv_imported)=="X"] <- "car_name"
view(mtcars_csv_imported)
mtcarsColumns <- colnames(mtcars_csv_imported)
print(mtcarsColumns)

# Create a variable called mtcarsSummary that contains a summary table of the dataset mtcars
mtcarsSummary <- summary(mtcars)
print(mtcarsSummary)

# Create a variable called dratValue that contains the decimal value of the drat(Rear axle ratio) column for the only car that 
# has 6 cylinders and greater than 21 mpg.
dratValue <- select(filter(mtcars_csv_imported, cyl==6, mpg>21.0), c(car_name, mpg, cyl, drat))
print(dratValue)

# Create a variable called topQsec that orders the mtcars dataframe by Qsec in descending order and 
# then grab the top 6 rows from that data frame. topQsec should be of type data frame with 6 rows and 11 columns.
# Created a function to fetch decimal value, i.e., do reverse of a trunc funtion.
revtrunc <- function(x) { x - floor(x) }
revtrunc(2.345)
dratValue=select(dratValue,mpg)
dratValue=revtrunc(dratValue)
topQsec <- head(arrange(mtcars_csv_imported,desc(qsec)), n = 6)