dataset = read.csv('Social_Network_Ads.csv')
dataset = dataset[2:5]

dataset$Gender = factor(dataset$Gender,
                        levels = c("Male","Female"),
                        labels = c(1,2))

library(caTools)
set.seed(123)
split= sample.split(dataset$Purchased,SplitRatio = 3/4)
training_set= subset(dataset,split==TRUE)
test_set=subset(dataset,split==FALSE)

test_set[,2:3]=scale(test_set[,2:3])
training_set[,2:3]=scale(training_set[,2:3])


##classifier
classifier = glm(Purchased~.,
                 family = binomial,
                  data = training_set)
prob_pred = predict(classifier,type = 'response',test_set[-4])
y_pred = ifelse(prob_pred>.5,1,0)
y_pred
##Confusion Matrix
cm = table(test_set[,4],y_pred)
cm
##Visualising the classifier
