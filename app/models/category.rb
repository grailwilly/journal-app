class Category < ApplicationRecord
  belongs_to :user
  validates :name, presence: true

  has_many :tasks, dependent: :destroy
end
