library(shiny)
library(mvtnorm)
library(MASS)
library(plot3D)

# Define UI ----
ui <- fluidPage(
  titlePanel("Bivariate Normal Distribution"),
  sidebarLayout(
    sidebarPanel(
      numericInput("mu1", "Mean of X:", 0, min = -5, max = 5),
      numericInput("mu2", "Mean of Y:", 0, min = -5, max = 5),
      numericInput("sd1", "Standard Deviation of X:", 
                   1, min = 0.1, max = 10),
      numericInput("sd2", "Standard Deviation of Y:", 
                   1, min = 0.1, max = 10),
      numericInput("rho", "Correlation Coefficient:", 
                   0, min = -1, max = 1),
      # selectInput("color", "Color Scheme:",
      #             choices = c("Red", "Blue", "Green", "Rainbow", "Heat", "Terrain")),
      plotOutput("plot")
    ),
    mainPanel(
      tableOutput("summary")
    )
  )
)

# Define server ----
server <- function(input, output) {
  # Generate data based on user input
  data <- reactive({
    mu <- c(input$mu1, input$mu2)
    sigma <- matrix(c(input$sd1^2, input$rho * input$sd1 * input$sd2, 
                      input$rho * input$sd1 * input$sd2, input$sd2^2), 
                    nrow = 2, ncol = 2)
    x <- seq(-10, 10, length.out = 40)
    y <- seq(-10, 10, length.out = 40)
    z <- matrix(0, nrow = length(x), ncol = length(y))
    for (i in 1:length(x)) {
      for (j in 1:length(y)) {
        z[i, j] <- dmvnorm(c(x[i], y[j]), mean = mu, sigma = sigma)
      }
    }
    list(x = x, y = y, z = z)
  })
  
  # Create plot based on user input
  output$plot <- renderPlot({
    
    # heat.colors.density <- function(n, max_density) {
    #   # Create a sequence of values from 0 to 1
    #   x <- seq(0, 1, length.out = n)
    #   # Define a custom color palette that increases towards the highest density
    #   colors <- cbind(x, sqrt(x), x^3)
    #   # Normalize the colors so that they range from 0 to 1
    #   colors <- apply(colors, 2, function(x) (x - min(x)) / (max(x) - min(x)))
    #   # Scale the colors to the maximum density value
    #   colors <- apply(colors, 2, function(x) x * max_density)
    #   # Convert the colors to RGB format
    #   colors <- apply(colors, 1, function(x) rgb(x[1], x[2], x[3], maxColorValue = 255))
    #   # Return the color palette
    #   colors
    # }
    # Estimate the 2-dimensional kernel density using kde2d
    dens <- kde2d(seq(-10, 10, 
                      length.out = 100), 
                  seq(-10, 10, length.out = 100), 100)
    
    # Find the maximum density value in the grid
    max_density <- max(dens$z)
    
    # nbcol = 100
    # color = rev(rainbow(nbcol, start = 0/6, end = 4/6, alpha = .9))
    # mycut = function(x, breaks) as.numeric(cut(x=x, breaks=breaks)) # to combine different factors
    # zcol2 = as.numeric(apply(data()$z,2, mycut, breaks=nbcol)) 
    # 
    
    persp3D(data()$x, data()$y, data()$z, 
            xlab = "X", ylab = "Y", zlab = "Density",
            theta = 30, phi = 15, expand = 0.85,
            shade=0.4, col.palette = heat.colors)
  })
  # Crte table summary based on user input
  output$summary <- renderTable({
    mu <- c(input$mu1, input$mu2)
    sigma <- matrix(c(input$sd1^2, input$rho * input$sd1 * input$sd2, 
                      input$rho * input$sd1 * input$sd2, input$sd2^2), 
                    nrow = 2, ncol = 2)
    cov <- sigma * input$rho
    colnames(cov) <- c("X", "Y")
    rownames(cov) <- c("X", "Y")
    data.frame("Mean" = mu, "Covariance Matrix" = cov)
  })
}

# Run the app ----
shinyApp(ui = ui, server = server)
