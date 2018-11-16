
# Week-2.
# Prithvi Adhikarla.

# 4.4
1. 
my_variable <- 10
my_variable

2. 
install.packages("tidyverse")
library(tidyverse)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

3. 
filter(mpg, cyl = 8)

4. 
filter(diamonds, carat > 3)
# -------------------------------------------------------------

# 5.2.4

Find all flights that ...

1.1.had an arrival delay of two or more hours.
install.packages("tidyverse")
install.packages("/Users/padhikarla/Downloads/nycflights13_1.0.0.tar.gz", repos=NULL, method="libcurl")
library(nycflights13)
df_arr_delay_2hrs <- filter(flights, arr_delay>=120)

1.2. Flew to Houston (IAH or HOU)
filter(flights, dest %in% c('IAH', 'HOU'))

1.3. Were operated by United, American, or Delta
filter(flights, carrier %in% c('UA', 'AA', 'DL'))

1.4. Departed in summer (July, August, and September)
filter(flights, month %in% c(7,8,9))

1.5. Arrived more than two hours late, but didn’t leave late
filter(flights, arr_delay>=120 & dep_delay==0)

1.6. Were delayed by at least an hour, but made up over 30 minutes in flight
df_made_up_late_time <- filter(flights, dep_delay>=60 & arr_delay <30)

1.7. Departed between midnight and 6am (inclusive)
(filter(flights, sched_dep_time>=0000 & sched_dep_time <= 0600))

# 5.2.4
2.Another useful dplyr filtering helper is between(). What does it do? Can you use it to simplify the code needed to answer the previous challenges?
filter(flights, between(month, 7, 9))
filter(flights, between(sched_dep_time, 0000, 0600))



3. How many flights have a missing dep_time? What other variables are missing? What might these rows represent?
filter(flights,is.na(dep_time))
8255 flights.

# Below shows the column names that have missing values.
colnames(flights)[ apply(flights, 2, anyNA) ]

Q: What might these rows represent?
A: I am guessing thse are charter flights departed from NY Airport.

4. Why is NA ^ 0 not missing? Why is NA | TRUE not missing? Why is FALSE & NA not missing? 
Can you figure out the general rule? (NA * 0 is a tricky counterexample!)
4A: NA^0 = 1; as anything to the power of zero is 1. 
NA | TRUE = TRUE; as general of thumb, if one of the conditions in an OR check is TRUE, the result is TRUE.
FALSE & NA = FALSE; as general of thumb, if one of the conditions in an AND check is FALSE, the result is FALSE.
NA * 0 = NA;  as a general of thumb, anything multiplied by zero should be a zero. But this is an anomaly result to get a NA.


# -------------------------------------------------------------------------------------------

5.3.1 How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
arrange(flights,desc(is.na(dep_time)))

5.3.2 Sort flights to find the most delayed flights. Find the flights that left earliest.
(arrange(flights,desc(arr_delay))
(arrange(flights, sched_dep_time, dep_delay))

5.3.3 Sort flights to find the fastest flights.
df_flights_with_speed <- arrange(flights %>% mutate(speed = distance/air_time), desc(speed))

5.3.4 Which flights travelled the longest? Which travelled the shortest?
Answer: I do not think we can compute this with the information available because of inadequate information.
Sorting by distince would not satisfy the requirement as the "distance" is only the distance between airports when
in fact a flight can be in the air for more time and travel more distance because of bad weather, etc..
# ---------------------------------------------------------------------------------------------

5.4.1 Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.

select(flights, dep_time, dep_delay, arr_time, arr_delay)
select(flights, 4, 6, 7, 9)
select(flights, starts_with("dep_"), starts_with("arr_"))