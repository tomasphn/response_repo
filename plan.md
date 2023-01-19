## Requirements
- multiple users
- each comment must have number of reactions tracked
- user sign up
- sort feature based on message reactions

Here is a general plan for building a system that meets the requirements you've specified, using Ruby on Rails:

- Create a new Rails application using the command rails new app_name.
- Set up a database and configure the config/database.yml file.
- Create a User model using the command rails generate model User. This model will handle user sign up and authentication.
- Create a Comment model using the command rails generate model Comment. This model will handle the comments and their associated reactions.
- Create a Reaction model using the command rails generate model Reaction. This model will handle the reactions to the comments and their associated reactions.
- Create a Reaction table using the command rails db:migrate.
- Create a Comment table using the command rails db:migrate.
- Create a User table using the command rails db:migrate.
- Create a User controller using the command rails generate controller User.
- Create a Comment controller using the command rails generate controller Comment.
- Create a Reaction controller using the command rails generate controller Reaction.
- Create views for the User, Comment, and Reaction controllers using the command rails generate views User, rails generate views Comment, rails generate views Reaction.
- Add routes to config/routes.rb for the User, Comment, and Reaction controllers.
- Add association between the Comment and Reaction models, so that each comment can have multiple reactions.
- Add association between the User and Comment models, so that each user can have multiple comments.
- Add sort feature using the command rails generate migration add_sort_to_comments
- Add a sort feature to the Comment controller, to sort the comments based on the number of reactions.
- Add sign up feature to the User controller, to handle user sign up.
- Test the application using rails server and rails test

Phrase
- 
Response
- 

- Join table: User reactions to responses
- Reaction id
- emotions
  - like
    - array of user ids
  - love
  - haha
  - wow
  - sad
  - angry

**Database**
- Main Data: Responses
  - id (PRIMARY KEY)
  - response text (varchar 100)
  - prompt text (varchar 100)
  - emotions
    - like (int)
    - love (int)
    - haha (int)
    - wow (int)
    - sad (int)
    - angry (int)
- Users
  - id (PRIMARY KEY)
  - username
- Join: Reactions
  - Reaction id
  - emotions
    - like
      - array of user ids
    - love
    - haha
    - wow
    - sad
    - angry