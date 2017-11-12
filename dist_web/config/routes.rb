Rails.application.routes.draw do
  get 'client', to: 'client#show'
  get 'iplist', to: 'leader#iplist'
end
