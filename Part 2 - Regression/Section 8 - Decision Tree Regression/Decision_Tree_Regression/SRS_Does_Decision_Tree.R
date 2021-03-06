# Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# # install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$Salary, SplitRatio = 2/3)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting the Regression Model to the dataset
# Create your regressor here
regressor = rpart(Salary~.,
                  dataset,
                  control = rpart.control(minsplit = 1))
summary(regressor)

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

# Visualising the Regression Model results
x_grid = seq(min(dataset$Level),max(dataset$Level),0.001)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             color='red')+
  geom_line(aes(x=x_grid,y=predict(regressor,data.frame(Level=x_grid))),
            color='blue')+
  ggtitle('DST_REG')+
  xlab('LEVEL')+
  ylab('SALARY')  
