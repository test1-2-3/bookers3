class User < ApplicationRecord
 devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
 # deviseでemailを不必要にする
 def email_required?
   false
 end
 def email_changed?
   false
 end


	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name,length: { minimum: 2, maximum: 20 }
	validates :introduction,length: { minimum: 2, maximum: 50 }, on: :update
    attachment :profile_image

    has_many :books, dependent: :destroy
end