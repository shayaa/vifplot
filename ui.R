library("ggvis")
shinyUI(pageWithSidebar(
  div(),
  sidebarPanel(
    sliderInput("l", "Value of lambda", min = 0, max = 1,
                value = .5, step = .1),
    selectInput("Pred", "Choose your Predictor:", 
                choices = c('type', 'income','education','prestige')),
    selectInput("hold", "Leave out a Regressor:", 
                choices = c('type', 'income','education','prestige')),
    uiOutput("plot_ui")
  ),
  mainPanel(
    ggvisOutput("plot"),
    tableOutput(NULL)
  )
))