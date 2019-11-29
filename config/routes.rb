Rails.application.routes.draw do
  resources(:bloggers)
  resources(:posts)
  resources(:destinations)
end
