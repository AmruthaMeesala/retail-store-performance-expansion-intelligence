# Retail Store Performance & Expansion Intelligence

## Business Problem

Retail businesses need to understand which store characteristics and operating factors are associated with stronger sales performance before making expansion decisions.

The objective of this project is to analyze historical retail store performance and identify important factors related to sales, customer demand, promotions, store formats, assortments, and competition.

The analysis provides insights that can support future retail expansion decisions.

---

## Dataset

The project uses the Rossmann Store Sales dataset.

The dataset contains daily sales and customer information for Rossmann stores along with store-level characteristics such as:

- Store Type
- Assortment
- Competition Distance
- Promotion information
- School Holidays
- Store operating status

---

## Tools & Technologies

- PostgreSQL
- SQL
- Power BI
- DAX

---

## Data Model

The project uses two main tables:

### Train Table
Contains daily store-level performance data.

Key columns:
- Store
- Date
- Sales
- Customers
- Promo
- Open
- StateHoliday
- SchoolHoliday

### Store Table
Contains store-level characteristics.

Key columns:
- Store
- StoreType
- Assortment
- CompetitionDistance
- Promo2
- CompetitionOpenSinceYear

The tables were connected using the `Store` column.

---

## Analysis Questions

The analysis focused on the following business questions:

1. Is customer traffic associated with higher sales?
2. How do promotion days compare with non-promotion days?
3. Does customer traffic increase during promotion periods?
4. How does competition distance relate to store performance?
5. Which store type performs best?
6. Which assortment category performs best?
7. Which stores are the highest performers?
8. What characteristics are associated with stronger store performance?
9. What insights can support future expansion decisions?

---

## Key Findings

### Customer Demand

Average customer traffic has a strong positive relationship with average sales, with a correlation of approximately **0.846**.

This indicates that stores with higher customer traffic generally tend to generate higher sales.

### Promotions

Average sales were approximately **81% higher on promotion days** compared with non-promotion days.

Average customer traffic was approximately **58% higher on promotion days**.

This suggests that promotion periods are associated with stronger customer traffic and sales performance.

### Store Type

**Store Type B** recorded the highest average daily sales among the store types analyzed.

### Assortment

**Assortment B** recorded the highest average daily sales among the assortment categories analyzed.

### Competition

Stores located very close to competitors recorded the highest average sales among the competition-distance groups.

However, competition distance alone did not show a consistent relationship with performance.

---

## Business Recommendations

### 1. Prioritize Customer Demand

Stores with higher customer traffic tend to generate higher sales. Future expansion decisions should prioritize locations with strong customer demand and footfall potential.

### 2. Use Promotions Strategically

Promotion days were associated with higher sales and customer traffic. Promotions should be targeted toward stores and periods where the response is strongest rather than applied uniformly.

### 3. Learn from High-Performing Store Formats

Store Type B and Assortment B recorded the highest average daily sales among the categories analyzed. These characteristics can be investigated further when evaluating future store formats.

### 4. Do Not Rely on Competition Distance Alone

Competition distance did not show a consistent relationship with store performance. Location decisions should consider competition along with customer demand, store format, promotions, and other local-market factors.

---

## Dashboard

The Power BI dashboard provides:

- Total Sales
- Total Customers
- Total Stores
- Average Daily Sales
- Top 10 Stores by Total Sales
- Average Daily Sales by Store Type
- Promotion vs Non-Promotion Sales
- Customer Traffic vs Average Sales
- Store Type filtering
- Promotion Status filtering

---

## Limitations

- The analysis is based on historical observational data, so the findings represent associations rather than proven causal relationships.
- The dataset contains existing Rossmann stores rather than actual future candidate locations.
- The dataset does not contain India-specific market information.
- Factors such as rent, population, income, local footfall, geography, and market size are not included.
- Competition distance should therefore not be used as the only factor when making expansion decisions.

---

## Conclusion

The analysis shows that customer demand, promotions, store format, and assortment are important factors associated with retail store performance.

The findings can be used as a starting point for expansion analysis, while future decisions should combine these insights with local market data such as population, purchasing power, footfall, competition, and operating costs.

---

## Project Workflow

CSV Dataset  
↓  
PostgreSQL  
↓  
SQL Data Analysis  
↓  
Power BI Dashboard  
↓  
Business Insights  
↓  
Expansion Recommendations
