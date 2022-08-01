class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    has_many :categories_post
    has_many :categories, through: :categories_post

    validates :content, presence: true
    validates :title, presence: true, uniqueness: true

    has_one :tag

    # scope :title_logner_than_n_characters, -> { where("LENGTH(content) > 10") }
    scope :title_longer_than_n_characters, ->(n) { where("LENGTH(content) > ?", n) }
end
