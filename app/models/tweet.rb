class Tweet < ApplicationRecord
  belongs_to :group,optional: true,dependent: :destroy
  belongs_to :user,optional: true
  
  validates :text, presence: true

  def self.search(search)
    if search
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end
