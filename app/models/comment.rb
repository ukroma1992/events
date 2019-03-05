class Comment < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  validates :event, presence: true
  validates :body, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }

  def user_name
    return  user.name if user.present?
    super
  end
end
