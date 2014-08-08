--> View/create a schedule (Monday, Tuesday...)
--> View/create a workout
--> View/create an exercise

# User Types

* User: Someone who wants to create and review a workout routine for themselves

# Stories

As a user
In order to [accomplish goal X or achieve a given business value]
I want to [perform an action]

## User views a schedule's details

As a user
In order to view what I should be doing for the day
I want to read details about the schedule

./wt
  => Press (number) to pick a schedule.  Type 'add' to add a schedule.
    1. Monday
    2. Tuesday
  1
  => Press (number) to select a workout.  Type 'add' to add a workout
    1. Chest and Triceps
    2. Shoulders

Acceptance Criteria:
* User navigates to the schedule and selects which day to display
* Displays the schedule for the day

## User adds a schedule

As a user
In order to create a new schedule for the day
I want to create a new schedule that is contained in the list of schedules

./wt
  => Press (number) to pick a schedule.  Type 'add' to add a schedule.
    1. Monday
    2. Tuesday
  add
  => Type the name of the schedule you'd like to add
  Wednesday
  => Wednesday has been added.

Acceptance Criteria:
* User navigates to the schedule and selects which day to display
* Displays the schedule for the day

## User views a workout's details

As a user
In order to decide whether to add or view exercises in a workout
I want to view a workout

  => Press (number) to pick a schedule.  Type 'add' to add a schedule.
  1. Monday
  2. Tuesday
  1
  => Press (number) to select a workout.  Type 'add' to add a workout
  1. Chest and Triceps
  2. Shoulders
  1
  => 1. Bench Press - weight: 180 lbs, reps: 10, sets: 3
     2. Skullcrushers - weight: 80 lbs, reps: 10, sets: 3
     3. Tricep Pulldown - weight: 100 lbs, reps: 10, sets: 3

Acceptance Criteria:
* User navigates schedule to arrive at the correct day
* User selects the workout they'd like to see
* Displays the exercises in the workout

## User adds a workout

As a user
In order to create a workout in a schedule
I want to make workouts that are contained in that schedule

Acceptance Criteria:
* User navigates to the day in the schedule
* User adds workout to that schedule
* Workout is saved to the Workout table and foreign key is also saved in the Schedule table
* User sees "Workout has been added to the database."

## User views an exercise's details

As a user
In order to do an exercise correctly
I want to read details about an exercise

  => Press (number) to pick a schedule.  Type 'add' to add a schedule.
    1. Monday
    2. Tuesday
  1
  => Press (number) to select a workout.  Type 'add' to add a workout
    1. Chest and Triceps
    2. Shoulders
  1
  => 1. Bench Press - weight: 180 lbs, reps: 10, sets: 3
     2. Skullcrushers - weight: 80 lbs, reps: 10, sets: 3
     3. Tricep Pulldown - weight: 100 lbs, reps: 10, sets: 3
    Type the number of the exercise to view details about it or type 'add' to add a new exercise.
  1
  => Bench Press - weight: 180 lbs, reps: 10, sets: 3, description: Lift a barbell off your chest.

Acceptance Criteria:
* User navigates through schedule to arrive at the correct day
* User navigates through workout and selects a exercise (via it's display number) to view its details
* Displays the exercise name being worked on
* Displays the exercise's description

## User adds an exercise

As a user
In order to create an exercise in a workout
I want to make exercises that are contained in that workout

./wt
  => Press (number) to pick a schedule.  Type 'add' to add a schedule.
    1. Monday
    2. Tuesday
  1
  => Press (number) to select a workout.  Type 'add' to add a workout
    1. Chest and Triceps
    2. Shoulders
  1
  => 1. Bench Press - weight: 180 lbs, reps: 10, sets: 3
     2. Skullcrushers - weight: 80 lbs, reps: 10, sets: 3
     3. Tricep Pulldown - weight: 100 lbs, reps: 10, sets: 3
    Type the number of the exercise to view details about it or type 'add' to add a new exercise.
  add
  => 'Enter exercise name'
  Incline Bench Press
  => 'Enter weight (lbs)'
  185
  => 'Enter sets'
  3
  => 'Enter reps'
  10
  => 'Successfully added Incline Bench Press, 180 lbs, 3 sets, 10 reps'

Acceptance Criteria:
* User navigates to the workout
* User adds an exercise
* Exercise is saved to the Exercise table and a foreign key is also added to the Workout table
* User sees "Successfully added Incline Bench Press, 180 lbs, 3 sets, 10 reps."



## The bottom is a template, from zss:
## Student marks a skill as mastered

As a student
In order to track my progress
I want to mark a skill as mastered

Acceptance Criteria:
* This builds on the skill details screen
* User is prompted with "Have you mastered this skill? y/n"
* Skill mastery is recorded in the achievements model
  * The progress (mastered / not mastered) is stored in the achievements model.
  * The datetime when the skill was finally mastered is stored.
* If a user updates their skill mastery, the existing achievement record is updated.
* If the skill is mastered, instead of being prompted with "Have you mastered this skill?" the user is shown "You mastered this skill on August 14th at 14:40" (or similar).
