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

end