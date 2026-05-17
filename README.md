# Berlin Airbnb Analytics Engineering Pipeline

End-to-end analytics engineering project analyzing Berlin Airbnb market performance across ~14K listings.  
Built with **AWS S3, Snowflake, dbt, and Power BI**, using medallion architecture, dimensional modeling, snapshots, incremental models, and dbt tests.

---

## 🔑 Key Findings

- **Mitte leads Berlin's Airbnb market** with approximately **€67M estimated annual revenue**.
- **Friedrichshain-Kreuzberg and Pankow** are the next strongest neighbourhood groups by estimated revenue.
- **Entire home/apartment listings dominate supply**, representing around **66% of total listings**.
- **Hotel rooms command the highest average price** at around **€309**, compared with private rooms at around **€88**.
- **Superhosts have higher average ratings** than non-superhosts, but do not necessarily charge the highest average prices.
- The Berlin Airbnb market shows an estimated **66% occupancy proxy** across the analyzed listings.

---

## 🏗️ Architecture

```text
Berlin Airbnb CSV Dataset
        ↓
AWS S3
        ↓
Snowflake Staging Tables
        ↓
dbt Bronze Layer
        ↓
dbt Silver Layer
        ↓
dbt Ephemeral / Intermediate Models
        ↓
dbt Gold Layer: Star Schema + OBT
        ↓
Power BI Dashboard
````

---

## 🛠️ Tech Stack

| Layer           | Tool                        |
| --------------- | --------------------------- |
| Cloud Storage   | AWS S3                      |
| Data Warehouse  | Snowflake                   |
| Transformation  | dbt                         |
| BI / Dashboard  | Power BI                    |
| Modeling        | Star Schema + One Big Table |
| Data Quality    | dbt Tests                   |
| Version Control | GitHub                      |

---

## 📊 Dashboard Preview

### Executive Overview

<img src="images/executive_overview.png" width="900">

### Host & Review Analytics

<img src="images/host_review_analytics.png" width="900">

### Pricing & Occupancy

<img src="images/pricing_occupancy.png" width="900">

---

## 🔄 dbt Lineage

The dbt lineage graph tracks the full transformation flow from raw Snowflake sources through bronze, silver, intermediate, gold, snapshots, and the final Power BI mart.

<img src="images/dbt_lineage.png" width="900">

---

## 📁 Project Structure

```text
berlin_airbnb_project/
│
├── models/
│   ├── bronze/
│   ├── silver/
│   ├── ephemeral/
│   ├── gold/
│   └── sources/
│
├── snapshots/
├── tests/
├── DDL/
├── images/
└── README.md
```

---

## 🧱 Data Models

### Bronze Layer

Raw Airbnb data loaded from Snowflake staging tables with light cleaning and type casting.

### Silver Layer

Cleaned and standardized listing, review, and neighbourhood models.

### Ephemeral Models

Reusable intermediate models for host deduplication, review activity, and review text aggregation.

### Gold Layer

Analytics-ready dimensional models and mart tables:

* `dim_listings`
* `dim_hosts`
* `dim_neighbourhoods`
* `fct_reviews`
* `mart_listing_performance_obt`

The final Power BI report uses `mart_listing_performance_obt`.

---

## ✅ Data Quality

Implemented dbt tests for:

* Primary key uniqueness
* Not-null checks
* Relationship integrity between fact and dimension tables

Result:

```text
13 tests passed
0 errors
```

---

## 🚀 How to Run

```bash
dbt debug
dbt run
dbt test
dbt snapshot
dbt docs generate
dbt docs serve
```

---

## 📌 Business Questions Answered

* Which Berlin neighbourhoods generate the most estimated Airbnb revenue?
* Which room types dominate the Berlin short-term rental market?
* Do superhosts perform better than non-superhosts?
* How do pricing segments relate to revenue and occupancy?
* Which listings are the strongest performers by estimated annual revenue?

---

## 👤 Author

**Maidul Islam**

Analytics Engineering Portfolio Project
Stack: **Snowflake, dbt, AWS S3, Power BI**

