class Entite < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :name, presence: true
  validates :amount, presence: true
  validates :group_id, presence: true
end
