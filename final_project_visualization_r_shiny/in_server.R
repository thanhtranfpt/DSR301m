

df_country <- reactive({
  adult %>% filter(native_country == input$country)
})

# TASK 5: Create logic to plot histogram or boxplot
output$p1 <- renderPlot({
  if (input$graph_type == "histogram") {
    # Histogram
    ggplot(df_country(), aes_string(x = ...)) +
      ... +  # histogram geom
      ... +  # labels
      ...    # facet by prediction
  }
  else {
    # Boxplot
    ggplot(df_country(), aes_string(y = ...)) +
      ... +  # boxplot geom
      ... +  # flip coordinates
      ... +  # labels
      ...    # facet by prediction
  }
  
})

# TASK 6: Create logic to plot faceted bar chart or stacked bar chart
output$p2 <- renderPlot({
  # Bar chart
  p <- ggplot(df_country(), aes_string(x = ...)) +
    ... +  # labels
    ...    # modify theme to change text angle and legend position
  
  if (input$is_stacked) {
    p + ...  # add bar geom and use prediction as fill
  }
  else{
    p + 
      ... + # add bar geom and use input$categorical_variables as fill 
      ...   # facet by prediction
  }
})
###############3
output$p2 <- renderPlot({
  # Bar chart
  p <- ggplot(df_country(), aes_string(x = ...)) +
    ... +  # labels
    ...    # modify theme to change text angle and legend position
  
  if (input$is_stacked) {
    p + ...  # add bar geom and use prediction as fill
  }
  else{
    p + 
      ... + # add bar geom and use input$categorical_variables as fill 
      ...   # facet by prediction
  }
})