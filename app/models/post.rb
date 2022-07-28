class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    has_many :categories_post
    has_many :categories, through: :categories_post

    validates :content, presence: true
    validates :title, presence: true, uniqueness: true
end
