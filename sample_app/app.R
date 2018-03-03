library(shiny)

ui <- fluidPage(
  fluidRow(
    column(6,
      selectInput('petal_col', '列：', c('Petal.Length', 'Petal.Width')),
      plotOutput('petal_plot'),
      tableOutput("petal_values")
    ),
    column(6,
      selectInput('sepal_col', '列：', c('Sepal.Length', 'Sepal.Width')),
      plotOutput('sepal_plot'),
      tableOutput("sepal_values")
    )
  )
)
server <- function(input, output, session) {
  output$petal_plot <- renderPlot({
    hist(iris[, input$petal_col])
  }) 
  output$sepal_plot <- renderPlot({
    hist(iris[, input$petal_col])
  }) 
  output$petal_values <- renderTable({
    data.frame(mean = mean(iris[, input$petal_col]))
  })
  output$sepal_values <- renderTable({
    data.frame(mean = mean(iris[, input$sepal_col]))
  })
}

shinyApp(ui, server)