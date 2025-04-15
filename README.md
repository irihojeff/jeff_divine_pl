# 🎓 Rwanda Academy SQL Window Functions Project

> **Group Name:** ThePrimaryKeys  
> **Course Assignment:** Exploring SQL Window Functions  
> **Collaborators:** MUTUYIMANA Divine 26855 & IDUKUNDIRIHO Japhet 27066  
> **Instructor GitHub Username:** `ericmaniraguha`  

---

## 📌 Project Overview

This project demonstrates the use of **SQL Window Functions** using a available dataset from a Rwandan school — **Rwanda Academy of Excellence**. The goal is to explore how advanced analytical queries like `LAG()`, `LEAD()`, `RANK()`, `DENSE_RANK()`, and aggregate functions can be applied to real-world educational data.

We worked as a team to:
- Design and populate a student dataset
- Apply and document multiple window functions
- Explain real-life applications of these queries
- Share our work via GitHub with tracked contributions

---

## 🗃️ Dataset Summary

We created a table called `students` with the following structure:

| Column          | Type        | Description                             |
|-----------------|-------------|-----------------------------------------|
| `student_id`    | INT         | Unique student identifier                |
| `student_name`  | VARCHAR(100)| Full name of the student                 |
| `gender`        | CHAR(1)     | Gender ('M' or 'F')                      |
| `class`         | VARCHAR(20) | Grade level (e.g., Grade 10, Grade 11)  |
| `total_score`   | INT         | Cumulative exam score                   |
| `admission_date`| DATE        | Date of admission                       |

The dataset includes **15 students** from **Grade 10**, **Grade 11**, and **Grade 12**.

---

## 📊 SQL Queries & Explanations

> ✅ **Note:** We have included screenshots in the `screenshots/` folder to show that each query has been successfully executed.

### 1️⃣ Compare Scores with Previous and Next Student

**Window Functions:** `LAG()`, `LEAD()`  
**Goal:** Compare each student’s `total_score` with the previous and next student.

We used a query that categorizes scores as **HIGHER**, **LOWER**, or **EQUAL** when compared with adjacent records.

**Real-Life Application:**  
Teachers can use this to track performance changes among students over time or by roll number.

---

### 2️⃣ Ranking Students Within Each Class

**Window Functions:** `RANK()`, `DENSE_RANK()`  
**Goal:** Rank students within each grade (`class`) by `total_score`.

We explained the difference between:
- `RANK()` – skips numbers when there’s a tie
- `DENSE_RANK()` – no gaps in ranking, even if scores are equal

**Real-Life Application:**  
Useful for generating honor rolls or scholarship eligibility per class.

---

### 3️⃣ Top 3 Students Per Class

**Window Function:** `ROW_NUMBER()`  
**Goal:** Display the top 3 students (highest scores) from each class.

**Real-Life Application:**  
Automatically generate top-performer lists for school awards or public display.

---

### 4️⃣ First 2 Admitted Students Per Class

**Window Function:** `ROW_NUMBER()` with `ORDER BY admission_date`  
**Goal:** Find the first two students admitted in each class.

**Real-Life Application:**  
Helps with tracking early enrollments, veteran students, or anniversary highlights.

---

### 5️⃣ Aggregation with Window Functions

**Window Function:** `MAX()` with `PARTITION BY`  
**Goal:** Show both:
- The **maximum score** per class
- The **overall highest score** in the school

**Real-Life Application:**  
Compare individual performance to class averages and overall best performer.

---

## 🧠 Key Learnings

- Window functions allow for row-by-row comparisons without collapsing results like GROUP BY.
- They are powerful for analytics in **education**, **HR**, **sales**, and more.
- Clear understanding of `PARTITION BY` and `ORDER BY` is critical to meaningful results.

---

## 🧑🏽‍🤝‍🧑🏽 Collaboration Summary

We worked collaboratively on:
- Dataset design and population
- Query writing and explanation
- Documentation and GitHub version control

Both team members contributed equally. Our GitHub commit history reflects this.

---

## 🔗 Repository Structure

```
/
├── sql/
│   ├── create_table.sql
│   ├── insert_data.sql
│   └── queries.sql
├── screenshots/
│   ├── query1_lag_lead.png
│   ├── query2_rank_dense_rank.png
│   ├── ...
├── README.md
```

---


## 🔚 Thank You!

This project showed us the real-world value of SQL analytics and taught us how to collaboratively build clean, tested, and well-documented codebases.
