require 'rails_helper'

RSpec.describe "Weights", type: :request do
  describe "user is not signed in" do
    describe "GET /new" do
      it "redirects to the index" do
          get new_weight_url
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "user is signed in" do
    let!(:user)   { create(:user) }

    before do
      sign_in user
    end

    describe "GET /new" do
      it "returns http success" do
          get new_weight_url
        expect(response).to be_successful
      end
    end
  end

end
