Rails.application.routes.draw do
  # Mount the Grape API
  mount BookStore::Base => '/'
  # Define any other non-API routes for your Rails application here.
end
