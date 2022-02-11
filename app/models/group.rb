class Group < ApplicationRecord
  belongs_to :user
  has_many :entities, class_name: 'Entite', dependent: :delete_all
  has_one_attached :icon

  validates :name, presence: true
  validates :icon, presence: true
end
