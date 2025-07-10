# 🚕 Uber Supply-Demand Gap Analysis

This project explores Uber ride request data to uncover **supply-demand mismatches** across different times and locations, particularly focusing on **City vs Airport pickups**. Using **Excel**, **SQL**, and **Python (Pandas + Seaborn)**, the analysis identifies operational pain points and provides **data-driven business recommendations**.

---

## 📊 Project Objectives

- Analyze ride request data to find patterns in demand and fulfillment
- Identify time slots and locations with high ride failures
- Understand whether failures are due to cancellations or no driver availability
- Suggest actionable steps to reduce the supply-demand gap

---

## 📁 Files Included

| File Name                          | Description |
|-----------------------------------|-------------|
| `Uber Request Data(cleaned).csv`           | Cleaned Uber request dataset |
| `uber-supply-demand-gap-analysis.ipynb`   | Complete Python notebook with EDA |
| `uber_insights_final.sql`         | SQL queries for analytical insights |
| `Uber Supply Demand Dashboard.xlsx` | Excel dashboard with charts & pivot tables |
| `README.md`                       | Project documentation |

---

## 🧰 Tools & Technologies Used

- **Excel**: Initial data cleaning, dashboard
- **Python**: Data wrangling, feature engineering, visualizations
- **Pandas**: Data analysis
- **Seaborn / Matplotlib**: Charts and plots
- **SQLite / DB Browser**: Query-based insights

---

## 🔍 Key Findings

- **Peak demand** hours are **5–10 AM** and **5–9 PM**
- **Highest failure rates** (cancellations or no cars) occur in:
  - Early mornings (5–9 AM)
  - Evenings (8 PM onwards)
- **Airport** suffers from more `No Cars Available` failures
- **City** experiences more `Cancelled` rides

---

## ✅ Business Recommendations

- **Incentivize drivers** to be active during high-failure slots
- **Deploy a dedicated airport fleet**
- **Predict demand** using historical patterns and adjust supply
- **Reduce cancellations** via driver reliability monitoring

---

## 📎 View Live on Kaggle

🔗 [Kaggle Notebook Link](https://www.kaggle.com/code/singhabhay1112/uber-supply-demand-gap-analysis)

## 💻 How to Run the Project Locally

### Step 1: Clone the Repository
git clone https://github.com/your-username/uber-supply-demand-gap.git
cd uber-supply-demand-gap

### Step 2: Install dependencies
pip install pandas matplotlib seaborn notebook

### Step 3: Run the jupyter notebook
jupyter notebook uber-supply-demand-gap-analysis.ipynb


