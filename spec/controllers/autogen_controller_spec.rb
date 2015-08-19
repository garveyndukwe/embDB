require 'spec_helper'

describe AutogenController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'tree'" do
    it "returns http success" do
      get 'tree'
      response.should be_success
    end
  end

  describe "GET 'report'" do
    it "returns http success" do
      get 'report'
      response.should be_success
    end
  end

end
