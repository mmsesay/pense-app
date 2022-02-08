class Entite < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
