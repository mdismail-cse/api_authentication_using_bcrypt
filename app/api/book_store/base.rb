module BookStore
  class Base < Grape::API




    mount BookStore::V1::Users
  end
end