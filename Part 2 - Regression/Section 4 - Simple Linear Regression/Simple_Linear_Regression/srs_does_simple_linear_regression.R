# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('Salary_Data.csv')

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)


##modelling
regressor = lm(formula = Salary ~ YearsExperience,
               training_set)
##predicting
y_predict = predict(regressor, newdata = test_set)

##Visualising the training sets
ggplot()+
  geom_point(aes(x = training_set$YearsExperience,
                 y = training_set$Salary),
             colour = 'red')+
  geom_line(aes(x=training_set$YearsExperience,
                y= predict(regressor,newdata = training_set)),
            colour = 'blue')+
  ggtitle('Years of exp v/s Salary')+
  xlab('Years of Exp')+
  ylab('Salary')

##visualising the test sets
ggplot()+
  geom_point(aes(x = test_set$YearsExperience,
                 y = test_set$Salary),
             colour = 'red')+
  geom_line(aes(x=training_set$YearsExperience,
                y= predict(regressor,newdata = training_set)),
            colour = 'blue')+
  ggtitle('Years of exp v/s Salary test')+
  xlab('Years of Exp')+
  ylab('Salary')