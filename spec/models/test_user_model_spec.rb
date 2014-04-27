require 'spec_helper'

describe "user has values" do
  let! (:user) { create (:user)}
  it "has user name" do
    expect (user.respond_to?(:username).should be_true)
  end
  it "has email" do
    expect(user.respond_to?(:email).should be_true)
  end
    
end

describe "relationship of posts to users" do
  let! (:user) { create (:user)}
  it "has posts" do
    expect(user.respond_to?(:posts).should be_true)
  end
  
end

