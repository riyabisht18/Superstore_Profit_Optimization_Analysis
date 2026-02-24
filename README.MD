# Superstore Profit Optimization Analysis 🚀

 ![Image Alt](https://github.com/riyabisht18/Superstore_Profit_Optimization_Analysis/blob/3d4e7ae5c211b5499c1759b80f9961459aad23d2/Dashboard_Image.png).

## 📌 Executive Summary
**Goal:** Increase Profit Margin from **12.5%** to **20%**.

I analyzed **5,009 retail transactions** using **SQL Server** and discovered that excessive discounts were destroying profitability. I modeled a solution to **cap discounts at 20%**, which is projected to increase annual profit by **$177,000 (+62%)** without losing customers.

| Metric | Current State | Projected State | Impact |
| :--- | :--- | :--- | :--- |
| **Profit** | $287K | **$464K** | **+$177K 🚀** |
| **Margin** | 12.5% | **20.2%** | **Target Met ✅** |
| **Retention** | 98.5% | 98.5% | **Safe** |

---

## 🔍 Key Findings (The "Why")
1.  **The "Profit Cliff":** Discounts **>20%** turn profitable sales into losses. This bleeds **$135,000 annually**.
2.  **Loyalty is Strong:** RFM Segmentation shows **59% of customers are Champions or Loyal**.
3.  **Retention Rate:** At **98.5%**, the data proves customers value the brand quality over cheap prices, making it safe to reduce discounts.
4.  **Geographic Hotspots:** Texas and Ohio are the biggest loss-makers due to uncontrolled discounting.

---

## 💡 The Solution (The "How")
**Recommendation: Implement a strict 20% Discount Cap.**

*   **Financial Impact:** Instantly eliminates the $135K loss and adds **$177K** to the bottom line.
*   **Operational Cost:** **$0**. (This is a policy change, not a marketing expense).
*   **Strategy:** Shift from blanket discounts to VIP perks for "Champion" customers to maintain loyalty.

---

## 🛠️ Tech Stack & Skills
*   **SQL Server:** CTEs, Window Functions (`LAG`, `OVER`), Aggregate Functions, Data Cleaning.
*   **Tableau:** Dashboard Design, Calculated Fields.
*   **Business Analysis:** RFM Segmentation, Pareto Principle (80/20), Scenario Modeling.

---

## 📂 Repository Files
*   `Superstore_Analysis_Full.sql` - **Master Script:** Contains all 20 analysis queries (Data Exploration, Discount Analysis, RFM, Scenario Modeling).
*   `Superstore_Dashboard.twbx` - The Tableau Workbook file.
*   `dashboard_screenshot.png` - Dashboard Preview image.

---

### 🚀 Conclusion

This project demonstrates how data analysis can solve business problems. A simple, data-backed policy change achieves the **20% margin goal** and increases annual profit by **62%**.

