class User < ApplicationRecord
  has_many :recipes, dependent: :destroy

  has_attached_file :avatar, styles: { medium: '152x152#' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 16 }
  validates :user_name, presence: true
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
