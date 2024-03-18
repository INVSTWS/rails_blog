class Post < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    has_many :comments, dependent: :destroy


    def self.ransackable_attributes(auth_object = nil)
        ["title", "content", "introduction"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["title", "content", "introduction"]
    end
end
