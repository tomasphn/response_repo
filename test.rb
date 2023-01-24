# controller
@prompt = Prompt.find(1)

# view
@prompt.text
@prompt.responses
@prompt.response.find(1).reactions

@prompt.responses.each do |response|
  <p>response.reaction</p>
end

# controller
@response = Response.find(1)

# view
@response.reaction_counts #=> {sad => 1, happy => 2}


## 
# rails console => like binding.pry
# Response.all
# Response.find => return single response
# 