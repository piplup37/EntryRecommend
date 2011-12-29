require 'spec_helper'

describe FriendRequestController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'confirm'" do
    it "returns http success" do
      get 'confirm'
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'send_list'" do
    it "returns http success" do
      get 'send_list'
      response.should be_success
    end
  end

  describe "GET 'recieve_list'" do
    it "returns http success" do
      get 'recieve_list'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show'
      response.should be_success
    end
  end

end
