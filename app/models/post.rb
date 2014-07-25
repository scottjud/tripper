class Post < ActiveRecord::Base
  belongs_to :trip

  validates :site, presence: true,
                   length: { minimum: 2 }

  validates :description, presence: true,
                          length: { minimum: 4 }
end
