Rails.application.routes.draw do

  root 'home#home'

  get 'home/home', as: 'home'

  get 'home/about', as: 'about'

  get 'home/disclaimer', as: 'disclaimer'

  get 'home/further_resources', as: 'further_resources'

  get 'home/privacy_policy', as: 'privacy_policy'

  get 'home/glossary', as: 'glossary'

  get 'home/how_to_use_this_website', as: 'how_to_use_this_website'

  get 'questions/timing', to: 'questions#timing', as: 'timing'

  get 'questions/pros_and_cons', to: 'questions#pros_and_cons', as: 'pros_and_cons'

  get 'questions/family_risks', to: 'questions#family_risks', as: 'family_risks'

  get 'questions/useful', to: 'questions#useful', as: 'useful'

  get 'questions/results', to: 'questions#results', as: 'results'

end
