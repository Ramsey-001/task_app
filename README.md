# README

# Task App

A simple Task Management application built with **Ruby on Rails**.  
It allows users to create, edit, delete, search, filter, and sort tasks.

## Features
- Create, edit, and delete tasks  
- Keyword search (title & description) using **Ransack**  
- Filter by deadline range  
- Filter by status (Todo, Doing, Done) with radio buttons  
- Sort tasks by deadline (ascending/descending)  

## Setup
1. Clone the repo  
   ```bash
   git clone git@github.com:Ramsey-001/task_app.git
   cd task_app
2.nstall dependencies
  bundle install
  yarn install --check-files

3.Setup database
  rails db:create db:migrate db:seed

4.Start the server
  rails server
  Visit: http://localhost:3000


*Requirements*
  Ruby 3.1+
  Rails 6.1+
  PostgreSQL

*Notes*
 Uses Ransack for search & sorting
 Status is an enum: todo, doing, done
 Default seed includes 50 tasks for testing
