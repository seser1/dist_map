Rails.application.routes.draw do
  get 'client', to: 'client#show'
  post 'client', to: 'client#run'

  get 'iplist', to: 'leader#iplist'
end
