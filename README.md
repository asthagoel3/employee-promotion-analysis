# Employee Promotion Analysis

This project analyzes employee lifecycle data to uncover what drives promotions and pay growth.  
Using SQL in **BigQuery**, I explored promotion rates by department, gender, and education, providing insights into workforce equity and career progression.  

---

## 📊 Dataset Overview
The dataset (`employee_lifecycle.promotion_data`) contains employee-level records with demographic, performance, and promotion outcomes.  

**Sample Schema:**
| employee_id | department        | region    | education        | gender | recruitment_channel | no_of_trainings | age | previous_year_rating | length_of_service | awards_won_ | avg_training_score | is_promoted |
|-------------|------------------|-----------|------------------|--------|----------------------|-----------------|-----|-----------------------|-------------------|-------------|---------------------|-------------|
| 42205       | Sales & Marketing | region_2  | null             | m      | other               | 1               | 20  | 5.0                   | 2                 | 0           | 43                  | 0           |
| 67491       | Sales & Marketing | region_15 | Bachelor's       | m      | sourcing            | 1               | 20  | null                  | 1                 | 0           | 43                  | 0           |

---

## 🎯 Metrics Design
To frame the analysis, I focused on the following key metrics:  

- **Headcount** – Total employees in the dataset.  
- **Promotion Rate by Department** – % of employees promoted within each department.  
- **Promotion Rate by Gender** – % of employees promoted within each gender category.  
- **Promotion Rate by Education** – % of employees promoted at different education levels.  
- **Share of Promotions** – Which groups account for the largest share of total promotions.  

---

## 📈 Key Queries & Results

### 1. Headcount
- **Query file**: [`queries/headcount.sql`](queries/headcount.sql)  
- **Question answered**: What is the total number of employees in the dataset?  
- **Sample Output**:  

| headcount |
|-----------|
| 54808     |

---

### 2. Promotion Rate by Department
- **Query file**: [`queries/promotion_rate_by_department.sql`](queries/promotion_rate_by_department.sql)  
- **Question answered**: Which departments see the highest promotion rates relative to their size?  
- **Sample Output**:  

| department        | num_employees | num_promoted | percent_promoted |
|-------------------|---------------|--------------|------------------|
| Sales & Marketing | 16840         | 1213         | 2.21%            |
| Operations        | 11348         | 1023         | 1.87%            |
| Technology        | 7138          | 768          | 1.40%            |

---

### 3. Promotion Rate by Gender
- **Query file**: [`queries/promotion_rate_by_gender.sql`](queries/promotion_rate_by_gender.sql)  
- **Question answered**: Are promotions distributed equally between male and female employees?  
- **Sample Output**:  

| gender | gender_employees | gender_promotions | promotion_rate_within_gender | share_of_total_promotions |
|--------|------------------|-------------------|------------------------------|----------------------------|
| f      | 16312            | 1467              | 8.99%                        | 31.43%                     |
| m      | 38496            | 3201              | 8.32%                        | 68.57%                     |

---

### 4. Promotion Rate by Education
- **Query file**: [`queries/promotion_rate_by_education.sql`](queries/promotion_rate_by_education.sql)  
- **Question answered**: Do higher education levels correlate with higher promotion rates?  
- **Sample Output**:  

| education        | num_per_degree | num_promoted | promotion_rate |
|------------------|----------------|--------------|----------------|
| None indicated   | 2409           | 122          | 5.06%          |
| Bachelor's       | 36669          | 3008         | 8.20%          |
| Master's & above | 14925          | 1471         | 9.86%          |

---

## 🚀 How to Run
1. Clone this repository.  
2. Open queries in the [`queries/`](queries) folder.  
3. Run in **BigQuery** against the `employee_lifecycle.promotion_data` dataset.  

---

## 📌 Next Steps
- Expand to analyze **age, tenure, and performance ratings**.  
- Visualize results in Tableau/Looker Studio for clearer storytelling.  
- Compare promotion equity across multiple factors (intersectional analysis).  
