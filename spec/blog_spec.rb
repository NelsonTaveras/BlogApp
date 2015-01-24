require 'spec_helper'
require 'blog'
 
describe Blog do

  before :each do
    @blog = Blog.new
  end

  describe "#initialize" do
    it "Reads the posts.json file and returns a Blog object" do
      @blog.class.should == Blog
      @blog.posts.count.should == 3
    end
  end

end