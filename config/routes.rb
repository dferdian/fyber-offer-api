Rails.application.routes.draw do
  
  post 'sites/send_request' => 'sites#send_request', as: 'send_api_request'
  root 'sites#index'
end
