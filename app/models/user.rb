class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :trackable, :lockable, :timeoutable

  has_many :learning_items, dependent: :destroy
  has_many :kanjis, through: :learning_items, disable_joins: true
end
