class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   	validates :email, :email_format => { :message => 'not a valid email' }, uniqueness: true
    has_many :questions
    has_many :answers
    has_many :comments
end
