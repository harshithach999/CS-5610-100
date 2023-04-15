# Load libraries
# Title: EDA on Breast Cancer
# Team Members: "Harshitha Chollangi, Shreya Kolanupaka"

install.packages("shinydashboard")
library(shinydashboard)
library(shiny)
library(ggplot2)

# Read data
breast_cancer <- read.csv("calc_case_description_train_set.csv")
Breast_Cancer <- data.frame(breast_cancer)

# setwd("/BreastCancerAnalysis")

# server function
server <- function(input, output) {
  
  # Create a reactive data frame based on the input fields
  filtered_data <- reactive({
    # Filter the breast cancer data based on the input fields
    filtered_data <- breast_cancer %>%
      filter(assessment == input$assessment, pathology == input$pathology, calctype == input$calc.type)
    return(filtered_data)
  })
  
  # create plot for histogram on page 1
  output$plot1 <- renderPlot({
    
    # Subset data based on input range
    subset_data <- Breast_Cancer[Breast_Cancer$pathology == input$pathology, ]
    
    # create histogram
    ggplot(data = subset_data, aes(x = breast.density)) +
      geom_histogram(binwidth = 1, fill = "#fd7f67", color = "white") +
      labs(x = "Breast Density", y = "Frequency") +
      theme_minimal()
    
  })
  
 
  
}

# UI function
ui <- dashboardPage(
  
  # dashboard header
  dashboardHeader(title = "Breast Cancer Analysis"),
  
  # dashboard sidebar
  dashboardSidebar(
    sidebarMenu(
      menuItem("Page 1", tabName = "page1", icon = icon("dashboard")),
      menuItem("Page 2", tabName = "page2", icon = icon("dashboard"))
    )
  ),
  
  # dashboard body
  dashboardBody(
    
    # first page content
    tabItems(
      tabItem(tabName = "page1",
              # Sidebar with input for pathology
              sidebarPanel(
                selectInput(inputId = "pathology", label = "Pathology", choices = unique(Breast_Cancer$pathology))
              ),
              
              # Main panel with plot
              mainPanel(
                plotOutput(outputId = "plot1")
              )
      ),

      
      # third page content
      tabItem(tabName = "page2",
              h2("BreastCancer"),
              tags$img(src="den.png"),
              tags$p("Click", a(href="https://wiki.cancerimagingarchive.net/pages/viewpage.action?pageId=22516629", "here"), "to read full article.")
)
)
)
)

# Run Shiny app
shinyApp(ui = ui, server = server)
