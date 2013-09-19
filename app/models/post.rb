class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  has_many :messages
  has_many :comments, :as => :poly, dependent: :destroy

  validates_presence_of :user_id
  validates :title, :content, :presence => true

end
