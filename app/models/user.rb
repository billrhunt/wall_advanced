class User < ActiveRecord::Base
	  has_many :messages,  dependent: :destroy

	  has_many :posts, dependent: :destroy


	  has_many :owners, dependent: :destroy
	  has_many :blogs, through: :owners

	  has_many :comments, :as => :poly

	  validates :first_name, :last_name, :email, :presence => true


end
