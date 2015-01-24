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
      expect @post.first['title'].should == "Your second post"
    end
  end

  describe "#find_by_author" do
    it "Should return all the posts that match the specified author" do
      @posts = @blog.find_by_author("Pixelated")
      expect @posts.count.should == 2
    end
  end

  describe "#find_by_tag" do
    it "Should return all the posts that contain the specified tag" do
      @posts = @blog.find_by_tag("fitness")
      expect @posts.count.should == 2
      @posts = @blog.find_by_tag("cooking")
      expect @posts.count.should == 1
    end
  end

  describe "#tag_cloud" do
    it "Returns all the tags of posts list along with their frequency" do
      @tags = @blog.tag_cloud
      expect @tags["cooking"].should == 1
      expect @tags["fitness"].should == 2
    end
  end

  describe "#summary" do
    it "Displays the first n words of the post with the specified id" do
      expect { @blog.summary(1, 10) }.to output("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ornare").to_stdout
    end
  end

end