library(shiny)

df <- data.frame()

shinyUI(fluidPage(
  
  titlePanel("Salary vs. Experience Analysis"),
  
  br(),
  
  sidebarLayout(
    
    sidebarPanel(
      
      fluidRow(
        
        column(12,
               h4("Individual 1"),
               sliderInput('salary1', 'Annual Salary', 
                           min=1000, max=500000,
                           value=min(128000, 500000), 
                           step=1000, round=0),
               sliderInput('exp1', 'Years of Experience', 
                           min=2, max=50,
                           value=min(5, 50), 
                           step=5, round=0)
        ),
        
        column(12, 
               h4("Individual 2"),
               sliderInput('salary2', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(213000, 500000), 
                           step=500, round=0),
               sliderInput('exp2', 'Years of Experience', 
                           min=2, max=50,
                           value=min(15, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 3"),
               sliderInput('salary3', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(302000, 500000), 
                           step=500, round=0),
               sliderInput('exp3', 'Years of Experience', 
                           min=2, max=50,
                           value=min(25, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 4"),
               sliderInput('salary4', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(123000, 500000), 
                           step=500, round=0),
               sliderInput('exp4', 'Years of Experience', 
                           min=2, max=50,
                           value=min(6, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 5"),
               sliderInput('salary5', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(268000, 500000), 
                           step=500, round=0),
               sliderInput('exp5', 'Years of Experience', 
                           min=2, max=50,
                           value=min(18, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 6"),
               sliderInput('salary6', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(405000, 500000), 
                           step=500, round=0),
               sliderInput('exp6', 'Years of Experience', 
                           min=2, max=50,
                           value=min(29, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 7"),
               sliderInput('salary7', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(485000, 500000), 
                           step=500, round=0),
               sliderInput('exp7', 'Years of Experience', 
                           min=2, max=50,
                           value=min(35, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 8"),
               sliderInput('salary8', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(96000, 500000), 
                           step=500, round=0),
               sliderInput('exp8', 'Years of Experience', 
                           min=2, max=50,
                           value=min(5, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 9"),
               sliderInput('salary9', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(186000, 500000), 
                           step=500, round=0),
               sliderInput('exp9', 'Years of Experience', 
                           min=2, max=50,
                           value=min(13, 50), 
                           step=5, round=0)
        ),
        column(12,
               h4("Individual 10"),
               sliderInput('salary10', 'Annual Salary', 
                           min=1000, 500000,
                           value=min(278000, 500000), 
                           step=500, round=0),
               sliderInput('exp10', 'Years of Experience', 
                           min=2, max=50,
                           value=min(17, 50), 
                           step=5, round=0),
               actionButton("goButton", "Go!")         
               
        )
      ) # end of fluidrow
    ),# end of sidebarPanel
  
    mainPanel(
      
          tabsetPanel(type = "tabs", 
                      
            tabPanel("Histogram", plotOutput("hist1")),
            tabPanel("Raw Data Table", tableOutput("rawtable")),
            tabPanel("Summary Stats", verbatimTextOutput("summary")),
            tabPanel("Scatter Plot", plotOutput("scatter1")),
            tabPanel("Google Bar Chart", htmlOutput("chart")),
            tabPanel("Regression", verbatimTextOutput("regression")),
            
            tabPanel("About", 
                 
                  strong('Note'),
                  p('This About section provides the supporting documentation of the application.'),
                 
                  strong('About the Application'),
                  p('This simple web application is developed with',
                   a("Shiny.", href="http://www.rstudio.com/shiny/", target="_blank"),
                   ''),
                 
                 p('The application has various tabs showing different aspects of the Salary vs. Experience
                   data displayed on the left side of the screen. The input data is captured through slider widget.
                  Using these various tabs, I try to display the raw data, basic plots, regression output of the data,
                  and a Google bar chart.
                   '),
                 
                strong('Users are advised to try out the application by changing the inputs on the left panel using the slider; 
                        reactive output will be displayed on the right panel.', style = "font-family: 'times'; font-si16pt; color:blue"),
                 
                 br(),
                 br(),
                 
                 strong('List of Packages Used'), br(),
                 code('library(shiny)'),br(),
                 code('library(RJSONIO)'),br(),
                 code('library(psych)'),br(),
                 code('library(googleVis)'),br(),
                 
                 br(),
                 
                 strong('Histogram'),
                 p('The histogram shows a basic plot of the Salary data vs. the frequency of its occurence.'),
                   
                 strong('Raw Data Table'),
                 p('This shows the tabular view of the Salary and Experience data.'),
                 
                 strong('Summary Stats'),
                 p('This shows the statistical summary of the data such as no. of observations,
                   mean, standard deviation, median, maximum, and minimum values.'),
                 
                 strong('Scatter Plot'),
                 p('This tab shows the scatter plot of the correlation between Salary and Experience.'),
                 
                 strong('Google Bar Chart'),
                 p('Here we try to explore Google Bar Chart using "googleVis" package. I use htmlOutput so that
                   the chart is visible on the browser.'),
                 
                 strong('Regression'),
                 p('This tab shows the linear regression summary output. Here I do a basic regression 
                   with Salary as dependent variable and Experience as independent variable.'),
                 strong('Note: Do not be deceived by high R-square value of 97%. This value cannot be trusted as
                        we are dealing with very small number of observations (n=10). The intention of this application
                        is not to show proper regression analysis, but to demonstrate a basic application
                        so that any novice user can use it.',
                        style = "font-family: 'times'; font-si16pt; color:blue"),
                 
                 br(),
                 
                 p(br())
                     
            )
            
            
            
          ) # end of tabsetPanel
        ) # end of mainPanel
    )  # end of sidebarLayout
  ) # end of pageWithSidebar
) # end of shinyUI
