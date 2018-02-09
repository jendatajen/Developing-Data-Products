
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(datasets)


# 1) Fuel Consumption (mpg) 2) Number of Cylinders (cyl) 3) Horsepower (hp) 4) Transmission (am)

dataset<-data.frame(mpg=mtcars$mpg,cyl=mtcars$cyl,hp=mtcars$hp,wt=mtcars$wt,am=mtcars$am)

dataset$cyl<-factor(dataset$cyl);dataset$am<-factor(dataset$am);

auto<-dataset[dataset$am==0,];
manual<-dataset[dataset$am==1,]

#Create linear models for automatic and manual Transmission to predict Fuel Consumption based on the other 3 variables

autoFit<-lm(auto$mpg ~ cyl+hp+wt,data=auto)

manualFit<-lm(manual$mpg ~ cyl+hp+wt,data=manual)

consumption<-function (cyl,hp,wt) {
  
  newdata<<-data.frame(cyl=as.factor(cyl),hp=hp,wt=wt)
  
  x<<-c(round(predict(autoFit,newdata),1),round(predict(manualFit,newdata),1))
  
  data.frame(Auto=round(predict(autoFit,newdata),1),Manual=round(predict(manualFit,newdata),1))
  
}


consumptionPlot<-function (cyl,hp,wt) {
  
  newdata<<-data.frame(cyl=as.factor(cyl),hp=hp,wt=wt)
  
  x<<-c(round(predict(autoFit,newdata),1),round(predict(manualFit,newdata),1))
  
  plot(x, xlab='Transmission',ylab='Miles per Gallon', ylim=c(0,35),col='blue',main='plot of MPG vs. Transmission',
          
          names.arg =c('Auto','Manual'),space=2)
          
  
}


shinyServer(
  
  function(input, output) {
    
    output$consumption <- renderPrint({consumption(input$cyl,input$hp,input$wt)})
    
    output$FuelConsumption <- renderPlot({consumptionPlot(input$cyl,input$hp,input$wt)})
    
  }
  
)