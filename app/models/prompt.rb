class Prompt < ApplicationRecord
  has_many :responses, dependent: :destroy

  SEED_USERS = [1, 2, 3, 4, 5]
  EMOTIONS = %w(likes loves haha wow sad angry)

  def generate_responses_reactions
    generated_responses = gtp3_responses[1..-1]

    generated_responses.each do |gen_response|
      response_hash = {text: gen_response[:responseText], user_id: SEED_USERS.sample}
      response_object = responses.create(response_hash)
      
      EMOTIONS.each do |emotion|
        reaction_count = gen_response[emotion.to_sym]
        seed_users_sample = SEED_USERS.clone.shuffle
        reaction_count.times do
          user_id = seed_users_sample.pop
          response_object.reactions.create(emotion: emotion, user_id: user_id)
        end
      end
    end
  end

  def gtp3_responses
    api_key = API_KEY
    client = OpenAI::Client.new(access_token: api_key)

    # Still need to find a way to get user input
    user_input = text

    # This is added to the prompt the user enters
    final_input = <<~HEREDOC
    Generate one more output following the input and output pairs that I provide below. The reactions are the likes, loves, hahas and et cetera, and they are numbers zero through ten and accurately portray the correct response. A sad response should not have many sad reactions for example. Vary the length of the responses a little bit, even more than to give an example. Do not repeat the samples that I give you below. Only give one output and nothing else.

    Examples:

    Input: "wat ur fav hobby?"
    Output:
    [
    {correctText: "What is your favorite hobby"},
    {responseText: "My favorite hobby is reading, I love getting lost in a good book and escaping into different worlds.", likes: 5, loves: 2, haha: 0, wow: 3, sad: 0, angry: 0},
    {responseText: "I love painting and drawing, it's a great way for me to express myself and be creative.", likes: 4, loves: 1, haha: 0, wow: 3, sad: 0, angry: 0},
    {responseText: "My hobby is playing music, it brings me so much joy and it's a great way to relax and unwind.", likes: 2, loves: 6, haha: 0, wow: 3, sad: 0, angry: 0},
    {responseText: "I enjoy hiking and being outdoors, it's a great way to get some exercise and be surrounded by nature.", likes: 3, loves: 0, haha: 0, wow: 2, sad: 0, angry: 0},
    {responseText: "I am a huge fan of cooking and experimenting with different recipes and ingredients, it's a lot of fun for me.", likes: 5, loves: 1, haha: 0, wow: 3, sad: 0, angry: 0}
    ]

    Input: "What is your favorite movie?"
    Output:
    [
    {responseText: "My favorite movie is [The Shawshank Redemption], I love the story, the characters and the ending.", likes: 5, loves: 2, haha: 0, wow: 3, sad: 0, angry: 0},
    {responseText: "I can't pick just one, but I love [The Godfather], [The Godfather Part II], and [The Godfather Part III] they are all amazing movies.", likes: 4, loves: 1, haha: 0, wow: 3, sad: 0, angry: 0},
    {responseText: "I adore the movie [The Dark Knight], I love the story, the characters and the acting, it's a masterpiece.", likes: 2, loves: 6, haha: 0, wow: 3, sad: 0, angry: 0},
    {responseText: "One of my favorite movies is [Schindler's List], it's a powerful and moving film, it tells a very important story.", likes: 3, loves: 0, haha: 0, wow: 2, sad: 0, angry: 0},
    {responseText: "I am a huge fan of [Forrest Gump], it's a heartwarming and funny film, I love the story, the characters and the acting.", likes: 5, loves: 1, haha: 0, wow: 3, sad: 0, angry: 0}
    ]

    Input: #{user_input}
    Output: 
    HEREDOC

    response = client.completions(
        parameters: {
              model: "text-davinci-003",
              prompt: final_input,
              max_tokens: 1000
          })
    response["choices"].map do |a|
      a["text"]
    end

  response_array = response["choices"].map {|a| a["text"]}
  parsed_array = eval(response_array.first)
  end
end
