# README

# Overview of Architecture
The app contains 2 models. The `user` stores the users name and a unqiue auto incremented id. The `event` model contains a `clockin_time` and `clockout_time`. They describe the time the user clocked in and the time the user clocked out. The `event` model also has a foregin key to the `user` model. 

When a user clocks in, the system create a new event with the `clockin_time` is timestamped `Time.now`. When the user clocks out, the same events clockout_time is timestamped to `Time.now`. A user cannot create a new event without clockouting out a previous event.  

# Demo path
## URL
Hosted on Heroku
url: TOBE FILLED IN

## Teachers
Teachers access the app at root path `/`. Select their name from the dropdown and click "Go". The system with automatically clock you in or out.

## Admins
View all events and do CRUD by going to `/events`. View and modify users by going to `/users`

# Assumptions
- Teachers can only have 1 clock running at a time. No overlapping events allowed.

# Limitations / Future Enhancements
- Timezone is being displayed in UTC
- Tests
- Auth / login for users
- any user can impersonate any other user, solved by adding in login
- Validations for event overlap. While a user punching in or out cannot make two events overlap, an admin can do by modifying the end date time of individual events.
- auth on admin routes `/events`
- UX can be improved to show explict clock in or clock out action. How long they've been clock in etc. 
- Users model does not handle users with the same name. 
- Events index is sorted chronologically, maybe group by day or teacher.
- Auto clock out after a preset amount of time, maybe 8 hours.

# Questions
## How did you approach this challenge?
I boiled it down to its most fundamental functionality. Teachers being able to clock in and out. Admins being able to view all clocked events and running and designed the data model around that.

## What schema design did you choose and why?
Described in the architecture overview.

## If you were given another day to work on this, how would you spend it? What if you were given a month?
I would start by implementing the limitiations section. Fill in the validations so admins can't corrupt clock event data, add authentication followed by some basic tests on the model. Then a UI framework to make it look good.