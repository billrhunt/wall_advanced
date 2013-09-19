class Blog < ActiveRecord::Base
		  has_many :users, through: :owners
		  has_many :owners, dependent: :destroy

		  has_many :messages, through: :posts

		  has_many :posts, dependent: :destroy
		  has_many :comments, :as =>:poly, dependent: :destroy


		  validates :name, :description, :presence => true

end
