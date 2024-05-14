#Install packages for reading in Excel file and generating bar charts
install.packages("readxl")
install.packages("ggplot2")
library(readxl)
library(ggplot2)

#Read in Excel spreadsheet data into dataframe
popular_pizzas <- read_excel("PopularPizzas.xlsx")

#Rename column titles for bar chart
colnames(popular_pizzas) <- c("Pizza_Name", "Units_Sold")

# Create bar chart, order bars by units sold (descending)
ggplot(popular_pizzas, aes(x=Units_Sold, y=reorder(Pizza_Name,+Units_Sold))) +
  geom_bar(stat = "identity", fill="lightblue") +
  theme_minimal() +
  labs(title = "Pizzas by Popularity", x = "Units Sold", y = "Pizza Name")

#Save bar chart to local file
ggsave("popular_pizzas_chart.png", width = 10, height = 8, dpi = 300)
