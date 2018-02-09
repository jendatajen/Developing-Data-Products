
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

library(datasets)

shinyUI(
  
  pageWithSidebar(
    
    
    headerPanel("Motor Trend Car Fuel Consumtpion Prediction"),
    
    sidebarPanel(
      h4('Select the cylinders, Weight & horse power'),
      #radioButtons("am","Transmission Type",c("Automatic" = "0","Manual" = "1")),
      checkboxGroupInput('cyl', 'Number of cylinders:', c('Four'=4, 'Six'=6, 'Eight'=8), selected = c(4,6,8)),
      
      #numericInput('hp', 'Gross horsepower (hp)(50 - 350)', 100, min = 50, max = 350, step = 5),value=c(50,350),
      sliderInput('hp', 'Gross horsepower (hp)', 100, min = 50, max = 350,  step=5),
      numericInput('wt', 'Weight (lb/1000)', 2, min = 2, max = 6, step = .2),
      
      submitButton('Submit')
      
    ),
    
    mainPanel(
      
      h3('Fuel Consumtpion Prediction'),
     
      h4('Miles per Gallon Fuel Consumption '),
      
      verbatimTextOutput('consumption'),
      
      plotOutput('FuelConsumption'),
      
      h4 ('In this project, we created a Shiny application and deployed it on RStudio servers, 
and used R Presentations (also known as RStudio Presenter) 
          to prepare a reproducible pitch presentation about our application.'),
      
      h4('This shiny application has been developed for the purposes of the Coursera Developing data products course project. 
         Data used are from mtcars dataset in R, 
         which contains information on technical characteristics of vehicles 
         as published in motor trend magazine. 
         In the application developed the user can insert in left panel numerical values 
         for vehicle horsepower, number of cylinders and vehicle weight. 
         The application uses appropriate linear regression algorithms 
         to predict fuel consumption for automatic and manual transmission vehicles. 
         The results are shown both in numbers and in the plot in the right panel of the application.')
      
    )
    
  )
  
)