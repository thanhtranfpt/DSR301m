# Load libraries
library(shiny)
library(tidyverse)
library(ggthemes)

# Read in data
adult <- read_csv("adult.csv")
# Convert column names to lowercase for convenience 
names(adult) <- tolower(names(adult))

# Define server logic
shinyServer(function(input, output) {
  
  df_country <- reactive({
    adult %>% filter(native_country == input$country)
  })
  
  # TASK 5: Create logic to plot histogram or boxplot
  output$p1 <- renderPlot({
    continuous_var <- input$continuous_variable
    
    if (input$graph_type == "histogram") {
      # Histogram
      ggplot(df_country(), aes_string(x = continuous_var)) +
        geom_histogram() +  # histogram geom
        labs(x = continuous_var,
             y = "Count",
             title = paste("Histogram of", continuous_var)) +  # labels
        facet_wrap(~prediction) +  # facet by prediction
        theme_minimal() +  # Apply minimal theme to the plot
        theme(panel.grid.major = element_blank(),  # Remove major grid lines
              panel.grid.minor = element_blank())  # Remove minor grid lines
    }
    else {
      # Boxplot
      ggplot(df_country(), aes_string(y = input$continuous_variable)) +
        geom_boxplot() +  # boxplot geom
        coord_flip() +  # flip coordinates
        labs(y = input$continuous_variable,
             x = "Prediction",
             title = paste("Boxplot of", input$continuous_variable)) +  # labels
        facet_wrap(~prediction) +  # facet by prediction
        theme_classic() +  # Apply classic theme to the plot
        theme_fivethirtyeight() +  # Apply fivethirtyeight theme to the plot
        theme(panel.grid.major = element_blank(),  # Remove major grid lines
              panel.grid.minor = element_blank())  # Remove minor grid lines
    }
  })
  
  # TASK 6: Create logic to plot faceted bar chart or stacked bar chart
  output$p2 <- renderPlot({
    categorical_var <- input$categorical_variable
    
    # Bar chart
    p <- ggplot(df_country(), aes_string(x = categorical_var)) +
      labs(x = categorical_var,
           y = "Count",
           title = paste("Bar Chart of", categorical_var)) +
      theme(axis.text.x = element_text(angle = 45),
            legend.position = "bottom",
            panel.grid.major = element_blank(),  # Remove major grid lines
            panel.grid.minor = element_blank())  # Remove minor grid lines
    
    if (input$is_stacked) {
      p + geom_bar(aes_string(fill = "prediction"), position = "stack")  # add bar geom and use prediction as fill
    }
    else {
      p + geom_bar(aes_string(fill = categorical_var)) +
        facet_wrap(~ prediction)  # facet by prediction
    }
    
  })
  
})
