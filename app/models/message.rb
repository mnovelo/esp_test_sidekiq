class Message < ApplicationRecord
  has_many :blasts, dependent: :destroy
end
