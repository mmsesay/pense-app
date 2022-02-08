class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups, foreign_key: 'user_id'
  has_many :entities, class_name: 'Entite'

  validates :name, presence: true
  validates :password, presence: true
end
