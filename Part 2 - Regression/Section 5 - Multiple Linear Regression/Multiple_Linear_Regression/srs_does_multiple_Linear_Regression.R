# Data Preprocessing Template

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encodistng categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))
# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit , SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

##MLR
regressor = lm(formula = Profit ~ .,
               training_set)
y_predict = predict(regressor,newdata = test_set)

##building optimal Model(used backward elimination)
regressor = lm(formula = Profit ~ R.D.Spend,
               dataset)
summary(regressor)
y_predict2 = predict(regressor,test_set)
y_predict2

ggplot()+
  geom_point(aes(x = test_set$R.D.Spend,y = test_set$Profit),
             colour = 'red')+
  geom_line(aes(x=training_set$R.D.Spend,y= predict(regressor,newdata = training_set)),
            colour = 'blue')+
  ggtitle('rd spend v/s profit')+
  xlab('rd spend')+
  ylab('profit')