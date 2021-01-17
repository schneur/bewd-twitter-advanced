require "rails_helper"

RSpec.describe "Route definition", :type => :routing do
  it "of POST /users" do
    expect(:post => "/users").to route_to(:controller => "users", :action => "create")
  end

  it "of POST /sessions" do
    expect(:post => "/sessions").to route_to(:controller => "sessions", :action => "create")
  end

  it "of GET /authenticated" do
    expect(:get => "/authenticated").to route_to(:controller => "sessions", :action => "authenticated")
  end

  it "of DELETE /sessions" do
    expect(:delete => "/sessions").to route_to(:controller => "sessions", :action => "destroy")
  end

  it "of POST /tweets" do
    expect(:post => "/tweets").to route_to(:controller => "tweets", :action => "create")
  end

  it "of GET /tweets" do
    expect(:get => "/tweets").to route_to(:controller => "tweets", :action => "index")
  end

  it "of DELETE /tweets/:id" do
    expect(:delete => "/tweets/:id").to route_to(:controller => "tweets", :action => "destroy", :id => ":id")
  end

  it "of GET /users/:username/tweets" do
    expect(:get => "/users/:username/tweets").to route_to(:controller => "tweets", :action => "index_by_user", :username => ":username")
  end
end
