**Overview**
This project demonstrates end-to-end SQL skills including data cleaning and exploratory data analysis on a stock market dataset. It is designed to showcase skills relevant to a Data Analyst role in the finance domain.

**Dataset**
**Two tables were used:**
**stock_prices (Clean Table)**
Contains daily stock price data for 10 major companies including Apple, Microsoft, Tesla, JPMorgan and more.

1100+ rows
Columns: ticker, company name, sector, date, open, close, high, low, volume, market cap

**stock_transactions (Dirty Table)**
Contains stock transaction records that required cleaning before analysis.

1100+ rows
Columns: ticker, trade date, transaction type, quantity, price per share, total amount, broker name, trader id, status

**Data Cleaning Steps**

1. Standardized mixed date formats into proper DATE type
2. Fixed inconsistent casing in transaction type, broker name and status
3. Removed 'shares' text from quantity column and converted to INT
4. Removed '$' prefix from price column and converted to DECIMAL
5. Handled NULL values by deleting or recalculating where possible

**Analysis Questions**

Total volume traded per company
Average closing price per company
Total transaction amount per broker
Monthly total transaction amount
Top 5 most traded stocks by quantity
Rolling average of closing price per company
Rank companies by total transaction amount per year
Highest single day price jump per company
BUY vs SELL total amount per company
