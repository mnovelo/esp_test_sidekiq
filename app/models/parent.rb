class Parent < ApplicationRecord
  has_many :kin_relations, dependent: :destroy
  has_many :students, through: :kin_relations
end
