require 'spec_helper'
require 'blog'
 
describe Blog do

  before :each do
    @blog = Blog.new
  end

  describe "#initialize" do
    it "Reads the posts.json file and returns a Blog object" do
      @blog.class.should == Blog
    end
  end

  describe "#posts" do
    it "Should countain all the posts in the JSON file" do
      @blog.posts.count.should == 3
    end
  end

  describe "#find_by_id" do
    it "Should return all the posts that match the specified id" do
      @post = @blog.find_by_id(2)
      expect @post.count.should == 1
      expect @post[0]['title'].should == "Your second post"
    end
  end

end