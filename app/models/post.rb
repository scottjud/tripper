class Post < ActiveRecord::Base
  belongs_to :trip

  validates :site, presence: true
end
