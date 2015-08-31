library(shiny)
library(RJSONIO)
suppressPackageStartupMessages(library(googleVis))
library(psych)


shinyServer(
  function(input, output) {
    
    # About the data and program
    output$about <- renderPrint({
      print("About Me")
    })  
    
    output$hist1 <- renderPlot({
      
      # Consolidating all salary and experience input values and loading into a data frame
      Salary <- c(input$salary1,input$salary2,input$salary3,input$salary4,input$salary5,
                  input$salary6,input$salary7,input$salary8,input$salary9,input$salary10)
      Experience <- c(input$exp1, input$exp2, input$exp3, input$exp4, input$exp5,
               input$exp6, input$exp7, input$exp8, input$exp9, input$exp10)
      df <- data.frame(Salary, Experience)
 
      # Creating a reactive code to display regression output summary in proper format
 
          reg <- reactive({
       
          regressionOutput <- lm(Salary ~ Experience, data = df)
          result <- summary(regressionOutput)
          print(result)
          confInterval <- confint(regressionOutput)
        
          cat("---", "\n", "95% CI of B (Unstandardized beta):", "\n")
          print(confInterval)
          
          z <- scale(df)     
          z <- data.frame(z)
          z.res <- summary(lm(Salary ~ ., z))
          
          stdb <- data.frame(round((z.res$coefficients[,1][-1]),3))
          colnames(stdb)[1] <- "Standardized beta"
          
          cat("\n", "---", "\n", "Standardized beta estimates:", "\n")
          print(stdb)
        
       }) # end of reg reactive
      
        makecorPlot <- function(){
          pairs.panels(df)
        }
      
      input$goButton  
      
      isolate({
        
            # Generate an HTML table view of the data
            output$rawtable <- renderTable({df})
            
            # Generate a summary of the data
            output$summary <- renderPrint({
               describe(df)[2:10]
            })
        
            # Plot histogram of data
            output$hist1 <- renderPlot({
              plot(hist(df$Salary), main="Histogram of Salary data", col="blue")
            })  
              
            # Generate scatter plot
            output$scatter1 <- renderPlot({
              print(makecorPlot())
            })
            
            # Generate the chart
            M <- gvisBarChart(df, xvar = "Salary", yvar = "Experience", options = list(width = 600, height = 400))
            output$chart <- renderGvis({
                gvisBarChart(df, xvar = "Salary", yvar = "Experience", options = list(width = 600, height = 400))
            })
        
            # Show regression output
            output$regression <- renderPrint({
                reg()
            })
            
      }) # end of isolate
    }) # end of output$hist1
  }) # end of shinyServer
