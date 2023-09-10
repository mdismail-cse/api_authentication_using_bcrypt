class Friend < ApplicationRecord
  belongs_to :user


  enum status: {unaccepted: 0, accepted: 1}
end
