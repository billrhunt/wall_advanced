class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  has_many :comments, :as => :poly, dependent: :destroy

  validates_presence_of :user_id
  validates_presence_of :post_id

  validates :author, :message, :presence => true


end
