# homework_2_sb — Flutter Mini-App (10 Exercises)

A simple Flutter app that opens on **EXERCISES** (home page) and shows **10 buttons (5×2 grid for checking the exercises functional)**.  
Each button navigates to its own page implementing a separate Dart task.

- Input validation on every page with friendly messages  
- Each exercise page includes a **“Back to EXERCISES”** button

---

## Screens / Exercises

### Exercise 1 — Movies & Years
- Inputs:
  - **3 movie titles** as quoted, comma-separated string: "Movie1","Movie2","Movie3"
  - **3 years** as comma-separated numbers: 1998,2000,2003  
    (must be 4-digit and within **1888–2025**)
- Default values:
- Output: pairs printed line by line (e.g., Taxi 1 — 1998)

### Exercise 2 — String Manipulations
- Inputs: two strings
- Output: shows
  - concatenation (s1 + " " + s2)
  - substring of the first string (first 0..3 characters)
  - uppercase / lowercase versions
  - title case

### Exercise 3 — Map Iteration
- Input: a simple map string like {"Armenia":"Yerevan","France":"Paris"}
- Output: prints key -> value for each entry

### Exercise 4 — Positive/Negative/Zero
- Input: an integer
- Output: "positive", "negative", or "zero"

### Exercise 5 — Name & Age Greeting
- Inputs: name (string), age (int)
- Output: personalized greeting and a message depending on age (adult or not)

### Exercise 6 — Safe Division
- Inputs: two numbers
- Output: result of division or Error: division by zero

### Exercise 7 — Current Date & Time
- Output: formatted timestamp YYYY-MM-DD HH:MM:SS
- Button to refresh

### Exercise 8 — Person Class
- Inputs: name, age
- Creates a Person object and displays its properties

### Exercise 9 — Extended Person & Life Stage
- Inputs: name, age
- Creates an AdvancedPerson and shows **life stage**: Child / Teenager / Adult / Senior

### Exercise 10 — Filter Evens (Lambda)
- Input: comma-separated integers (e.g., 1,2,3,4,5,6,10,11)
- Output: the **source list** and the **even numbers** filtered via a lambda

---


## Run

`ash
flutter pub get
flutter run
