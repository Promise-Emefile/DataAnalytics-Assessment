# DataAnalytics-Assessment

## Overview

The following structured SQL analysis queries are designed for financial and operational analytics. The queries are well formatted for better readability to ensure efficient data extraction for business intelligence.

## Assessment_Q1

### High Valued Customers With Multiple Products

The Purpose of these analysis is to identify customers with both savings and investment account to leaverage cross-selling opportunities

### Key Calculations

• Total number of savings accounts for each customers.

• Total number of investment account for each customers.

• Total deposit(savings + investments)

These insights enables personalized marketing campaigns targeted at users with diverse financial products.

## Assessment_Q2

### Transaction Frequency Analysis

This analysis to segment customers based on transactions frequency in order to classify them into different engagement categories.

### Key Calculations

• Average transactions of each months : Total Transactions/ Distinct Months

• Customers Segmentation:

  • "High Frequency" (≥10 transactions/month)

  • "Medium Frequency" (3-9 transactions/month)

  • "Low Frequency" (≤2 transactions/month)

These insights helps operations and marketing teams to identify customers engagement trends and optimize services.

## Assessment_Q3

### Account Inactivity Alert

These analysis is to flag accounts with no inflow transactions for over one year(365days) to support operational risk management.

### Key Calculations

• last_transaction_date: s.transaction_date < DATE_SUB(CURDATE(), INTERVAL 1 YEAR).

• Filtered inactive customers based on account type (savings/investment).

• Indentified account with the lowest inactivity days for each customers.

These analysis supports customer retention strategies and automated alerts for re-engagement efforts.

## Assessment_Q4

### Customer Lifetime Value (CLV) Estimation

This analysis is to estimate the Customer Lifetime Value (CLV) based on account tenure and transaction volume.

### Key Calculations

• Account Tenure: Month since signup (TIMESTAMPDIFFP(MONTH, u.date_joined, CURDATE() ))

• Total Transaction: count of transactions for each customers

• CLV formular:
                CLV = (total transactions/ tenure) * 12 * 0.1% * total_transaction_amount

These analysis is to sort customers by estimated CLV to identify high-value users for marketing and engagement strategies.

## Conclusion

These SQL analysis queries provide critical insights into customer behavior, financial product usage, and operational risks.
