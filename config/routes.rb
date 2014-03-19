Fortune::Application.routes.draw do
  
  get '/fortune(/:long)(/:dirty)' => 'fortunes#show'

end
