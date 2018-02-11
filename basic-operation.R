#list
name <- c("Beckham", "Ronaldo", "Messi")
age <- c(35,32,30)
clubs <- c("ManU", "Madrid", "Barca")
retired <- c(T,F,F)
my_list <- list(player_name = name,
                player_age = age,
                player_clubs = clubs,
                retired = retired)

#matrix

firstMatrix <- matrix(1:9, nrow=3, byrow = TRUE)
colnames(firstMatrix) <- c("A","B","C")
rownames(firstMatrix) <- c("R1","R2","R3")
cbind(firstMatrix , firstMatrix)
rbind(firstMatrix , firstMatrix)

firstMatrix <- firstMatrix*123/2323
t(firstMatrix)
solve(firstMatrix)

#data frame
## vector 
cities <- c("BKK","TOKYO","LONDON")
countries <- c("TH","JP","UK")
population <- c(10000,20000,30000)
df <- data.frame(cities,countries,population)

data(CO2)
dim(CO2)
str(CO2)

##function
yy <- c(1:10,NA,20,40)
mean(yy,na.rm = TRUE)
#basic no arg
first_func <- function() {
    print("Hi")
}
# 1 arg
sq_function <- function(input){
    print(input^2)
}

#data frames 
##Subset df
m <- mtcars
m[1:4,1:2]

#Subset by logic
m[m$mpg > 20,]
m[m$am==1,]
dim(m)
count(m)
nrow(m)
paste(nrow(m[m$am==1,])*100/nrow(m),"%")

#dplyr
m <- as.tbl(mtcars)
m
select(m,1:6,11) 
filter(m, hp<200 && am==1 || carb==1)
arrange(m,desc(hp))
mutate(m,hp.100 = hp/100)
summarise(m, avg_hp = mean(hp), max_wt = max(wt),min(hp))
#PIPE
m %>% 
  select(mpg,cyl,hp) %>% 
  filter(hp>150) %>% 
  arrange(desc(hp)) %>% 
  summarise(mean(hp))

head(m)
m %>%
  group_by(am) %>%
  summarise(mean(mpg))

#plot
names(m)
plot(m$hp, m$mpg, pch = 16, col = "red", 
     xlab="Horse Power", 
     ylab="Mile per gallon",
     main="Test plot")

hist(m$mpg, probability = TRUE)
lines(density(m$mpg))
boxplot(m$mpg)
summary(m$mpg)

#ggplot2 

ggplot(data=m,aes(x=hp, y=mpg)) + 
  geom_point() +
  geom_smooth()

ggplot(data=m,aes(x=hp, y=mpg)) +
  geom_point(size = 5,
             alpha = 0.5)

ggplot(data=m,aes(x=hp)) + 
  geom_histogram(bins = 5, fill = "yellow") +
  labs(x="house power",
      y="frequency",
      title="house power") +
  theme_minimal()




#LINEAR REGRESSION
m <- mtcars
m <- as.tbl(m)
m
cor(select(m, mpg, hp, wt, disp))

model_lr <- lm(mpg ~ ., data = m)
summary(model_lr)
#plot(model_lr)

#LOGISTIC REGRESSION
#Classification
library(MASS)
biopsy
log_r_model <- glm(class ~ . -ID, data = biopsy,
                   family = "binomial")
summary(log_r_model)

#Decision Tree
library(rpart)
library(MASS)
biopsy
dt_model <- rpart(class ~. -ID, data= biopsy,
                  method = "class")
summary(dt_model)
dt_model

install.packages("rpart.plot")
library("rpart.plot")
rpart.plot(dt_model)
