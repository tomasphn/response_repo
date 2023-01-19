class ResponseController < ApplicationController
  def index
    @responses = Response.all
    client = OpenAI::Client.new(access_token: "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")

    puts "Enter your phrase input:"
    user_input = gets.chomp

    sample_user_input = "Where did you go to school?"
    sample_responses = <<~HEREDOC
    [
      {responseText: "I went to [my school]", likes: 3, loves: 0, haha: 0, wow: 2, sad: 4, angry: 1},
      {responseText: "I studied at [my university]", likes: 5, loves: 1, haha: 0, wow: 3, sad: 2, angry: 0},
      {responseText: "I received my education from [my college]", likes: 2, loves: 6, haha: 0, wow: 0, sad: 0, angry: 1},
      {responseText: "My alma mater is [my school]", likes: 1, loves: 3, haha: 5, wow: 2, sad: 0, angry: 0},
      {responseText: "I am self-taught", likes: 4, loves: 2, haha: 0, wow: 3, sad: 0, angry: 1}
    ]
    HEREDOC

    final_input = <<~TEXT
    "I want you to make another input and output following the example provided below. The input for this should be: '#{user_input}'. Generate the output. Full example: 

    # Input: 
    #{sample_user_input}
    # Output: 
    #{sample_responses}
    TEXT

    response = client.completions(
        parameters: {
              model: "text-davinci-003",
              prompt: final_input,
              max_tokens: 1000
          })

    output = (response["choices"].map do |a|
      a["text"]
    end)

    puts output

    @output = output
  end
end
