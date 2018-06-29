# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'
class User

	attr_reader :name

	def initialize(name)
		@name = name
	end

	def photos
		Photo.all.select {|p| p.user == self}
	end
	
end

class Photo
	
	@@photos = [] 
	
	attr_accessor :user

	def initialize
		@@photos << self
	end

	def self.all
		@@photos
	end

	def comments
		Comment.all.select {|c| c.photo == self}
	end

	def make_comment(message)
		 Comment.new(message)
		 # binding.pry
	end
end

class Comment
	@@all = []

	attr_accessor :photo, :user

	def initialize(message)
		@message = message
		@@all << self
	end

	def self.all
		@@all
	end

end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
sandwich_photo.user.name
# => "Sophie"
sophie.photos
# => [#<Photo:0x00007fae2880b370>]


sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

Comment.all
#=> [#<Comment:0x00007fae28043700>]
