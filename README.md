# README

## This app is a test working around different topics:
- add users in a waiting list by compliting a form
- when completed, the users will get an email with a link to confirm or cancel the registration
- after confirmation, the user will see is position on the waiting list or will be informed of the cancelation.
- very basics views.
- 15 days after confirmation, users will have to reconfirm by email
- 20 days after confirmation, whitout reconfirmation, users will be deleted form the database

## informations:
- app on ruby and rails, ruby 3.0.0, rails 6.1.3.2
- require letter_opener, mailjet (and a mailjet acount), sidekiq, redis, sidekiq_scheduler
- deployed on heroku : https://coworkingbrestdev.herokuapp.com/

## setup:
- to use clone or fork the repository
- bundle install
- rails db:create
- rails db:migrate
- rails db:seed 
- rails s
- to use Redis, run : sidekiq
- go to http://localhost:3000/

## tasks:
the seed will provide you with unconfirmed users. to run the jobs manually:
- Rails c
- ReconfirmJob.perform_later
- EmptyingJob.perform_later

Lots of incomplete stuff to fix, have fun poking around!
