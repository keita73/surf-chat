class Group < ApplicationRecord
  has_many :group_users, through: :groups_users
  has_many :users
  has_many :messages,dependent: :destroy
  has_many :tweets,dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: true}

  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end
end
