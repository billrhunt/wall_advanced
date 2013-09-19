

Based on the new diagram

1. Create appropriate models
   Create appropriate validations (think about what fields you would need to require, what other validation rules you would need)
class Blog < ActiveRecord::Base
		  has_many :users, through: :owners
		  has_many :owners, dependent: :destroy

		  has_many :messages, through: :posts

		  has_many :posts, dependent: :destroy

		  validates :name, :description, :presence => true

end

class User < ActiveRecord::Base
	  has_many :messages,  dependent: :destroy

	  has_many :posts, dependent: :destroy


	  has_many :owners, dependent: :destroy
	  has_many :blogs, through: :owners

	  validates :first_name, :last_name, :email, :presence => true


end

class Message < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :post_id

  validates :author, :message, :presence => true


end

class Owner < ActiveRecord::Base
  belongs_to :user
  belongs_to :blog

    validates_presence_of :blog_id
    validates_presence_of :user_id


end

class Post < ActiveRecord::Base
  belongs_to :blog
  belongs_to :user
  has_many :messages

  validates_presence_of :user_id
  validates :title, :content, :presence => true

end



Using the console
Be able to create 5 users
	User.create( first_name: "bill" , last_name: "hunt", email: "bill@gmail.com")

Be able to create 5 blogs
	User.find(1),blogs.create( name: "cats and dogs", descriptions: "things i like about them")

To add the first user to the last blog, you would do the following: User.first.blogs = [Blog.last].  To add both the first and the last blog to the first user, you would do User.first.blogs = [Blog.first, Blog.last].  What would you do to add the second and third user to the second blog?
	User.limit(2).last.blogs = [Blog.limit(2).last]
	User.limit(3).last.blogs = [Blog.limit(2).last]
Have the first user create 3 posts, assign the first 2 posts to the first blog and the last post to the last blog
	User.first.posts.create( title: "cat killer", content: "watch it wiskers", blog_id: Blog.first)
	User.first.posts.create( title: "dog lover", content: "help me pick my next dog", blog_id: Blog.last)

Be able to create messages written by the second user in any post
	message_creator = User.find(2)
	post_2_message = Post.last

	Message_creator.messages.create( author: message_creator.first_name, message: "this is going great", post_id: p.id)

Be able to retrieve all messages from any specific post
	Post.last.messages.all

Be able to retrieve all the users that "own" any specific blog 
	Blog.find(1).users.all

