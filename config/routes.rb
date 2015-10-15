Rails.application.routes.draw do

  root 'home#home'

  get 'about' => "home", as: 'about'

  get 'disclaimer' => "home", as: 'disclaimer'

  get 'further_resources' => "home", as: 'further_resources'

  get 'privacy_policy' => "home", as: 'privacy_policy'

  get 'glossary' => "home", as: 'glossary'

  get 'how_to_use_this_website' => "home", as: 'how_to_use_this_website'

  get 'making_your_decision' => "home", as: 'making_your_decision'

  get 'about_this_decision' => "home", as: 'about_this_decision'

  get 'timing' => 'questions', as: 'timing'

  get 'pros_and_cons' => 'questions', as: 'pros_and_cons'

  get 'family_risks' => 'questions', as: 'family_risks'

  get 'useful' => 'questions', as: 'useful'

  get 'results' => 'questions', as: 'results'

end
