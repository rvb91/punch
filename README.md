# README

# Overview of Architecture
The app has to 2 models, `Event` and `User`. The `User` model stores the users name and a unqiue auto incremented id. The `Event` model contains a `clockin_time` and `clockout_time`. They describe the time the user clocked in and the time the user clocked out. The `event` model also has a foregin key to the `user` model.

When a user clocks in, the system creates a new event with the `clockin_time`  timestamped to `Time.now`. When the user clocks out, the same event's `clockout_time` is timestamped to `Time.now`. A user cannot create a new event without clockouting out a previous event.

# Demo URLs
Note: On first use please wait for a few minutes as Heroku takes time to boot up the dyno.
- Teachers: https://punchcard-demo.herokuapp.com/
- Admins - View Events: https://punchcard-demo.herokuapp.com/events
- Admins - View Users: https://punchcard-demo.herokuapp.com/users


## Teachers clocking in / out
Teachers access the app at root path `/`. Select their name from the dropdown and click "Go". The system with automatically clock you in or out. They can sign up by going to `/users/new`

## Admins
View all events and do CRUD by going to `/events`. View and modify users by going to `/users`

# Assumptions
- Teachers can only have 1 clock running at a time. No overlapping events allowed.

# Limitations / Future Enhancements
- Times are being displayed in UTC
- Tests
- Auth / login
- Any teacher can impersonate any other teacher and clock in/out on their behalf.
- Validations for event overlap. While a teacher punching in or out cannot make two events overlap, an admin can do so by modifying the `clockout_time` of individual events.
- Auth on admin routes `/events`, `/users`
- UX can be improved to show explict clock in or clock out action. How long they've been clock in etc. UX around this depends on the business case.
- Events index page is sorted reverse chronologically, room for improvement here. Agains depends on the business case.
- Auto clock out after a preset amount of time, maybe 8 hours.

# Questions
## How did you approach this challenge?
I boiled it down to its most essentail functionality. Teachers being able to clock in and out. Admins being able to view and modify events and users. The data model was designed to not only to support the prototype but also a relatively straightforward and easy path to making it more feature compelete.

## What schema design did you choose and why?
The schema contains the following tables: Events (clockin_time, clockout_time, user_id), Users (name). Users generate multiple events as they clock in and out. The events table captures that and also allows us to query it on a per user basis.

## If you were given another day to work on this, how would you spend it? What if you were given a month?
I would start by implementing the limitiations section. Fill in the validations so admins can't corrupt clock event data, add authentication followed by some basic tests on the model. Then a UI framework to make it look good.
