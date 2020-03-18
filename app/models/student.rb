class Student < ApplicationRecord
  has_many :kin_relations, dependent: :destroy
  has_many :parents, through: :kin_relations
end
