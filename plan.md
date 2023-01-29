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
 **Validations**
 - Users
  - UI/js: No
  - Model: Yes
  - Active Record: Yes
 - Prompts
  - UI/js: No
  - Model: Yes?(uniqueness?)
  - Active Record: No
 - Responses
  - UI/js: No
  - Model: Yes
  - Active Record: No
 - Reactions
  - UI/js: Yes
  - Model: Yes
  - Active Record: No

**AI Generation**
- Pulling up new prompt page
  - 
- Seed data

***Sample object***
[
  {responseText: "I went to [my school]", likes: 3, loves: 0, haha: 0, wow: 2, sad: 4, angry: 1},
  {responseText: "I studied at [my university]", likes: 5, loves: 1, haha: 0, wow: 3, sad: 2, angry: 0},
  {responseText: "I received my education from [my college]", likes: 2, loves: 6, haha: 0, wow: 0, sad: 0, angry: 1},
  {responseText: "My alma mater is [my school]", likes: 1, loves: 3, haha: 5, wow: 2, sad: 0, angry: 0},
  {responseText: "I am self-taught", likes: 4, loves: 2, haha: 0, wow: 3, sad: 0, angry: 1}
]

- User searches phrase
- Create prompt object for that prompt
- GPT3 to generate
  - Users/use existing users to create reaction
  - Reaction(made by user) for prompt
    - Reactions(made by user) for reaction

- 10 seeded users plan
- user searches a phrase
- Create prompt object for that prompt
  - Make responses
    - choose number 3-6
      - Choose random 3-6 users
      - Use those user ids to create 3-6 response objects
      - Ask gpt3 for 3-6 responses
      - Create objects with those users + gpt3 responses
  - Make reactions
    - For each emotion, we choose a random number (or have ai create the random number)
      - Create that amount of reaction objects
        - 1 person per reaction type
        - Choose random user from user pool (any user)

user submits a request with a prompt
  - create prompt object
  - feeding prompt string to ai
    - create 3-6 responses
      - format?
    - 

[
  {responseText: "I went to [my school] and studied hard to achieve my degrees. It was a challenging but ultimately rewarding experience.", likes: 3, loves: 0, haha: 0, wow: 2, sad: 0, angry: 1},
  {responseText: "I studied at [my university] and received my degree in [major]. It was a great experience and I met a lot of wonderful people there.", likes: 5, loves: 1, haha: 0, wow: 3, sad: 0, angry: 0},
  {responseText: "I received my education from [my college], it was a great experience and I learned a lot. I am proud of my achievements.", likes: 2, loves: 6, haha: 0, wow: 0, sad: 0, angry: 0},
  {responseText: "My alma mater is [my school], it was great experience and I am proud to have graduated from there.", likes: 1, loves: 3, haha: 5, wow: 2, sad: 0, angry: 0},
  {responseText: "I am self-taught, I didn't go to school but I learned a lot from books and online resources.", likes: 4, loves: 2, haha: 0, wow: 3, sad: 0, angry: 1}
]

ai_array = [{text: "response1 text", likes: 1, loves: 3, haha: 5, wow: 2, sad: 0, angry: 0}, {"respone2 text", likes: 1, loves: 3, haha: 5, wow: 2, sad: 0, angry: 0}]
prompt_id = current_prompt
ai_array.each do |response|
  random_user_id
  hash = {text: response, prompt_id: prompt_id, user_id = random_user_id}
  response = Response.create(hash) #=> response object
  response_id = response.id
  # run similar process to create reactions for this response
  emotions = ["sad", "happy", "etc"]
  emotions.each do |emotion|
    rand_num
    user_id_pool = get_seed_users
    rand_num.times
      random_user_id = user_id_pool.shift
      reaction_hash = {emotion: emotion, response_id: response_id, user_id: random_user_id}
    end
  end
end


Response.create({text: "responsetext", prompt_id: id, user_id: id})

response_hash = {text: "responsetext", prompt_id: id, user_id: id}
Response.create(response_hash)

**Todo: tomas**
- Add Delete button/methods for responses if they belong to that user
- Add devise to project
  - Make faux login page/fields for now
  - Make it so that edit/delete buttons only show up when response belongs to user
  - Make it so that you can only add response if your logged in
    - Limit how many responses you can make to a prompt?
  - Make it so that you can only add reactions if you are logged in

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
