class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, class_name: 'Entite'
  has_one_attached :icon
end
