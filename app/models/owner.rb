class Owner < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

  has_many :comments, :as => :poly, dependent: :destroy

    validates_presence_of :blog_id
    validates_presence_of :user_id


end
