# Install and load the required package
install.packages("rvest")
library(rvest)

# Specify the URL of the webpage
url <- "https://www.moneyworks4me.com/best-index/nse-stocks/top-nifty50-companies-list/"

# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract the table from the webpage
table <- html_table(html_nodes(webpage, "table")[[1]], fill = TRUE)

# Get the required columns from the table
required_columns <- c("Company Name (M.Cap)", "CMP", "Price Change", "Market Cap (Cr)", 
                      "52 Week High", "52 Week Low", "ROE", "P/E", "P/BV", 
                      "EV/EBITDA", "5YSales Gr(%)", "5YProfit Gr(%)")

# Filter and select the required columns from the table
filtered_table <- table[, required_columns]

# Remove any leading or trailing spaces in the column names
colnames(filtered_table) <- trimws(colnames(filtered_table))

# Print the resulting table
print(filtered_table)





library(rvest)
library(httr)

url <- "https://www.moneyworks4me.com/best-index/nse-stocks/top-nifty50-companies-list/"

# Set user-agent headers
headers <- c(
  'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.82 Safari/537.36',
  'Accept' = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8'
)

# Send a GET request with the headers
response <- httr::GET(url, httr::add_headers(headers))

# Read the HTML content of the webpage
webpage <- read_html(response)

# Rest of your code to extract the table and other information

# Define the URL of the webpage with the list of Nifty50 companies
url <- "https://www.moneyworks4me.com/best-index/nse-stocks/top-nifty50-companies-list/"
# Read the HTML content of the webpage
webpage <- read_html(url)

# Extract the table from the webpage
table <- html_table(html_nodes(webpage, "table")[[1]], fill = TRUE)

# Select the first 5 companies from the table
selected_companies <- table[1:5, ]

# Extract the URLs of the individual company pages
company_urls <- html_attr(html_nodes(webpage, "table a"), "href")

# Function to extract the required information for a given company URL
extract_company_data <- function(url) {
  # Read the HTML content of the company page
  webpage <- read_html(url)
  
  # Extract the required information
  sales <- html_text(html_nodes(webpage, "#financials-sales"))
  yoy_sales_gr <- html_text(html_nodes(webpage, "#financials-yoy-sales"))
  adj_eps <- html_text(html_nodes(webpage, "#financials-adj-eps"))
  yoy_adj_eps_gr <- html_text(html_nodes(webpage, "#financials-yoy-adj-eps"))
  bvps <- html_text(html_nodes(webpage, "#financials-bvps"))
  adj_net_profit <- html_text(html_nodes(webpage, "#financials-adj-net-profit"))
  cash_flow_ops <- html_text(html_nodes(webpage, "#financials-cash-flow-ops"))
  debt_cf_ops <- html_text(html_nodes(webpage, "#financials-debt-cf-ops"))
  roe <- html_text(html_nodes(webpage, "#financials-roe"))
  op_profit_mgn <- html_text(html_nodes(webpage, "#financials-op-profit-mgn"))
  net_profit_mgn <- html_text(html_nodes(webpage, "#financials-net-profit-mgn"))
  debt_to_equity <- html_text(html_nodes(webpage, "#financials-debt-to-equity"))
  working_cap_days <- html_text(html_nodes(webpage, "#financials-working-cap-days"))
  cash_conv_cycle <- html_text(html_nodes(webpage, "#financials-cash-conversion-cycle"))
  
  # Create a data frame for the extracted information
  company_data <- data.frame(
    Sales = sales,
    `YoY Gr. Rt.` = yoy_sales_gr,
    `Adj EPS` = adj_eps,
    `YoY Gr. Rt.` = yoy_adj_eps_gr,
    BVPS = bvps,
    `Adj Net Profit` = adj_net_profit,
    `Cash Flow from Ops.` = cash_flow_ops,
    `Debt/CF from Ops` = debt_cf_ops,
    `Return on Equity` = roe,
    `Op. Profit Mgn` = op_profit_mgn,
    `Net Profit Mgn` = net_profit_mgn,
    `Debt to Equity` = debt_to_equity,
    `Working Cap Days` = working_cap_days,
    `Cash Conv. Cycle` = cash_conv_cycle
  )
  
  # Return the extracted company data
  return(company_data)
}

# Create an empty data frame to store the extracted data
combined_data <- data.frame()

# Loop over the chosen companies and extract their data
for (url in company_urls) {
  full_url <- paste0("https://www.moneyworks4me.com/", url)
  company_data <- extract_company_data(full_url)
  combined_data <- rbind(combined_data, company_data)
}

# Print the resulting data frame
print(combined_data)
