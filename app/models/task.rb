class Task < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates :description, presence: true
	belongs_to :category
end
