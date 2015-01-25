require 'spec_helper'
require File.expand_path(File.join(File.dirname(__FILE__), "../sinatra/app.rb"))
require 'rack/test'

describe "Sinatra App" do

  include Rack::Test::Methods

  describe "/" do
    it "Should load the home page and show a list of tags" do
      get '/'
      last_response.should be_ok
      expect last_response.body.include?('#tags by popularity').should == true
    end
  end

  describe "/posts/:id" do
    context "with a valid id" do
      it "Should retrieve the post with the specified id" do
        get '/posts/1'
        expect last_response.body.include?('My first post').should == true
      end
    end
    context "with an invalid id" do
      it "Should display an error message" do
        get '/posts/1223'
        expect last_response.body.include?('Nothing to see here...').should == true
      end
    end
  end

  describe "/tags/:tag" do
    context "with a tag with at least one post" do
      it "Should retrieve all the post with the specified tag" do
        get '/tags/fitness'
        expect last_response.body.include?('Your second post').should == true
        expect last_response.body.include?('Your third post').should == true
      end
    end
    context "with a tag without posts" do
      it "Should display an error message" do
        get '/tags/myawesometag'
        expect last_response.body.include?('Nothing to see here...').should == true
      end
    end
  end

  describe "/author/:author" do
    context "with an author with at least one post" do
      it "Should retrieve all the post written by the specified Author" do
        get '/author/Pixelator'
        expect last_response.body.include?('My first post').should == true
      end
    end
    context "with an author with zero posts" do
      it "Should display an error message" do
        get '/author/invalid_autor'
        expect last_response.body.include?('Nothing to see here...').should == true
      end
    end
  end

end