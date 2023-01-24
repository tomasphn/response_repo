class Prompt < ApplicationRecord
  has_many :responses, dependent: :destroy

  SEED_USERS = [1, 2, 3, 4, 5]
  EMOTIONS = %w(likes loves haha wow sad angry)

  def generate_responses_reactions
    generated_responses = gtp3_responses

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

  private

  def gtp3_responses
    [
      {responseText: "I went to [my school] and studied hard to achieve my degrees. It was a challenging but ultimately rewarding experience.", likes: 3, loves: 0, haha: 0, wow: 2, sad: 0, angry: 1},
      {responseText: "I studied at [my university] and received my degree in [major]. It was a great experience and I met a lot of wonderful people there.", likes: 5, loves: 1, haha: 0, wow: 3, sad: 0, angry: 0},
      {responseText: "I received my education from [my college], it was a great experience and I learned a lot. I am proud of my achievements.", likes: 2, loves: 6, haha: 0,  wow: 0, sad: 0,angry: 0},
      {responseText: "My alma mater is [my school], it was great experience and I am proud to have graduated from there.", likes: 1, loves: 3, haha: 5, wow: 2, sad: 0, angry: 0},
      {responseText: "I am self-taught, I didn't go to school but I learned a lot from books and online resources.", likes: 4, loves: 2, haha: 0, wow: 3, sad: 0, angry: 1}
    ]
  end
end
