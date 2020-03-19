class Message < ApplicationRecord
  has_many :blasts, dependent: :destroy
  has_rich_text :content
end
