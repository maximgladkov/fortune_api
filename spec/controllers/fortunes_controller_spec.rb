require 'spec_helper'

describe FortunesController do

  describe "GET 'show'" do
    it "returns plain text" do
      get :show

      response.status.should eq(200)
      response.body.should match(/^.+$/)
    end

    it "returns json object with format" do
      get :show, '', { format: :json }

      response.status.should eq(200)
      
      json = JSON.parse(response.body)
      json['text'].should match(/^.+$/)
    end

    it "returns json object with content-type header" do
      @request.env["HTTP_ACCEPT"] = "application/json"
      @request.env["CONTENT_TYPE"] = "application/json"

      get :show

      response.status.should eq(200)
      
      json = JSON.parse(response.body)
      json['text'].should match(/^.+$/)
    end
  end

end
