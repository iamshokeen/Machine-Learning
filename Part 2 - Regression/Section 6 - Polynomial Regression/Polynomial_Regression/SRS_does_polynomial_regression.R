dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]
 ##linear model
lin_reg= lm(Salary~.,dataset)
summary(lin_reg)
##polynomial model
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(Salary~.,
              dataset)
summary(poly_reg)
##visualising the linear model
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             color='red')+
  geom_line(aes(x=dataset$Level,y=predict(lin_reg,dataset)),
            color='blue')+
  ggtitle('LIN_REG')+
  xlab('LEVEL')+
  ylab('SALARY')
##visualising the polynomial model

ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             color='red')+
  geom_line(aes(x=dataset$Level,y=predict(poly_reg,dataset)),
            color='blue')+
  ggtitle('POLY_REG')+
  xlab('LEVEL')+
  ylab('SALARY')

##improving visual
x_grid = seq(min(dataset$Level),max(dataset$Level),0.1)
ggplot()+
  geom_point(aes(x=dataset$Level,y=dataset$Salary),
             color='red')+
  geom_line(aes(x=x_grid,y=predict(poly_reg,data.frame(Level=x_grid,
                                                       Level2 = x_grid^2,
                                                       Level3 = x_grid^3,
                                                       Level4 = x_grid^4))),
            color='blue')+
  ggtitle('POLY_REG')+
  xlab('LEVEL')+
  ylab('SALARY')  


##predicting exact values
    #Linear prediction
      y_pred = predict(lin_reg,data.frame(Level=6.5))
      y_pred
    #Polynomial Prediction
      Y_Pred= predict(poly_reg,data.frame(Level=6.5,
                                          Level2=6.5^2,
                                          Level3=6.5^3,
                                          Level4=6.5^4))
      Y_Pred
      