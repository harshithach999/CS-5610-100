# Load libraries
#Title : EDA on Breast Cancer
#Team Members: "Shreya Kolanupaka, Harshitha Chollangi"

library(shiny)
library(ggplot2)

# Read data
breast_cancer <- read.csv("calc_case_description_train_set.csv")
Breast_Cancer<-data.frame(breast_cancer)

#setwd("harshithach999/CS-5610-100/calc_case_description_train_set.csv")

# Define server function
server <- function(input, output) {
  
  # Create a reactive data frame based on the input fields
  filtered_data <- reactive({
    # Filter the breast cancer data based on the input fields
    filtered_data <- breast_cancer %>%
      filter(assessment == input$assessment, pathology == input$pathology, subtlety %in% input$subtlety)
    return(filtered_data)
  })
  
  
  #create plot for histogram
  output$plot <- renderPlot({
    
    # Subset data based on input range
    subset_data <- Breast_Cancer[Breast_Cancer$pathology == input$pathology, ]
    
    #create histogram
    ggplot(data = subset_data, aes(x = breast.density)) +
      geom_histogram(binwidth = 1, fill = "blue", color = "white") +
      labs(x = "Breast Density", y = "Frequency") +
      theme_minimal()
    
  })
  
}


# Define UI function
ui <- fluidPage(
  
  # Sidebar with input for pathology
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "pathology", label = "Pathology", choices = unique(Breast_Cancer$pathology))
    ),
    
    # Main panel with plot
    mainPanel(
      plotOutput(outputId = "plot")
    )
  )
  
)

# Run Shiny app
shinyApp(ui = ui, server = server)
