class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :firstname, presence: true, length: {minimum:2, maximum:15}
  validates :lastname, presence: true, length: {minimum:2, maximum:15}
  validates :username, presence: true, length: {minimum:2, maximum:25}, uniqueness: true;
end
