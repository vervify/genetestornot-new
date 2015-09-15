Rails.application.routes.draw do

  root 'questions#landing'

  get 'questions/disclaimer', to: 'questions#disclaimer', as: 'disclaimer'

  get 'questions/landing', to: 'questions#landing', as: 'landing'

  get 'questions/timing', to: 'questions#timing', as: 'timing'

  get 'questions/pros', to: 'questions#pros', as: 'pros'

  get 'questions/family', to: 'questions#family', as: 'family'

  get 'questions/info', to: 'questions#info', as: 'info'

end
