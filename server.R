
library(shiny)
library(ggvis)
library(car)
shinyServer(function(input, output, session) {
  
  # A reactive vif dataframe
  compute_df <- reactive({

    Duncan[,1] <- as.numeric(Duncan[,1])
    mD <- as.matrix(Duncan)

    Dnot1 <- subset(mD, select = -which(names(Duncan) == input$hold))
    D1 <- as.matrix(mD[, input$hold])

    Y <- as.matrix(mD[,input$Pred])

    l = input$l
    Pnot1 <- Dnot1 %*% solve(t(Dnot1) %*% Dnot1) %*% t(Dnot1)
    ejhat = (diag(nrow(Pnot1)) - l*Pnot1)%*%(D1-mean(D1))
    eyhat = (diag(nrow(Pnot1)) - l*Pnot1)%*%(Y-mean(Y))
    vifplot = data.frame(occupation = row.names(ejhat),
                         eyhat = eyhat, ejhat = ejhat)

  })
  
  # A simple visualisation. In shiny apps, need to register observers
  # and tell shiny where to put the controls
  compute_df %>%
    ggvis(~ejhat, ~eyhat) %>%
    layer_points() %>%
    layer_model_predictions(model = "lm") %>%
    layer_text(text :=~occupation) %>%
    bind_shiny("plot", "plot_ui")
  
  })
