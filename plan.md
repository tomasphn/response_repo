## Requirements
- multiple users
- each comment must have number of reactions tracked
- user sign up
- sort feature based on message reactions

Here is a general plan for building a system that meets the requirements you've specified, using Ruby on Rails:

- Add association between the Comment and Reaction models, so that each comment can have multiple reactions.
- Add association between the User and Comment models, so that each user can have multiple comments.
- Add sort feature using the command rails generate migration add_sort_to_comments
- Add a sort feature to the Comment controller, to sort the comments based on the number of reactions.
- Add sign up feature to the User controller, to handle user sign up.
- Test the application using rails server and rails test

**Pages**
- Home Page (Response Controller)
  - Search Bar
  - Sample index?(seeded data to phrases)
  - Random (shows existing phrase)
    - Model: random method, to load random 
  - Login/logout button
- Single Response Page(response controller)
  - Prompt
  - Generated responses (Response)
    - User name
    - Reactions
      - User can add reactions
  - Add response
    - On page
- Sign in Page
- Sign up Page
- User Responses(Optional)

**Todo**
- Generate a bunch of user object seed data
  - use ChatGPT for that, I need a sample object though
- Create a Phrase (somebody searches it)
  - Creates responses
  - Assigns a random user to each response
- Add functionality for person to add response

*Prompt object*
Prompt.new({text: "this is the prompt text"})

What if I have a @responses instance variable
- how do i access each response => interate through each response
  - keys: text, prompt_id, user_id
- accessing the emoji count for each emoji
  - JOIN responses and reactions, count(id), match by response_id, GROUP BY type
  - Response.joins(:reactions, :users)
  - @response.count("sad") => this would be ideal
- accessing the author
  - JOIN responses and users, match by id
  - @reponse.author => ideal





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