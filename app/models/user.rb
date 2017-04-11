class User < ApplicationRecord
  has_many :recipes, dependent: :destroy

  validates :first_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates :user_id, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
