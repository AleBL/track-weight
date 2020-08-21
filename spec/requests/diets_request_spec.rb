require 'rails_helper'

RSpec.describe "/diets", type: :request do
  describe "user is not signed in" do
    describe "index" do
      it "redirects to the index" do
        get diets_url
        expect(response).to have_http_status(302)
      end
    end
  end

  describe "user is not allowed" do
    let(:user)             { create(:user) }
    let(:user_not_allowed) { create(:user) }
    let(:valid_params)     { attributes_for(:diet, user_id: user.id) }

    before do
      sign_in user_not_allowed
    end

    describe "index" do
      it "return code 401" do
        diet = Diet.create!(valid_params)
        get edit_diet_url(diet)
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "User is signed in" do
    let!(:user)   { create(:user) }
    let!(:weight) { create(:weight, user: user) }

    before do
      sign_in user
    end

    let(:valid_params)   {
      attributes_for(
        :diet, 
        initial_weight_attributes: { value: 0.2, unity: "kg" }, 
        ideal_weight_attributes:   { value: 0.2, unity: "kg" }, 
        user_id: user.id
      ) 
    }
    let(:invalid_params) {
      attributes_for(
        :diet, 
        initial_weight_attributes: nil, 
        ideal_weight_attributes: nil, 
        user_id: user.id
      )
    }

    describe "index" do
      it "renders a successful response" do
        Diet.create! valid_params
        get diets_url
        expect(response).to be_successful
      end
    end

    describe "show" do
      it "renders a successful response" do
        diet = Diet.create! valid_params
        get diet_url(diet)
        expect(response).to be_successful
      end
    end

    describe "new" do
      it "renders a successful response" do
        get new_diet_url
        expect(response).to be_successful
      end
    end

    describe "edit" do
      it "render a successful response" do
        diet = Diet.create! valid_params
        get edit_diet_url(diet)
        expect(response).to be_successful
      end
    end

    describe "create" do
      context "with valid parameters" do
        it "creates a new Diet" do
          expect {
            post diets_url, params: { diet: valid_params }
          }.to change(Diet, :count).by(1)
        end

        it "redirects to the created diet" do
          post diets_url, params: { diet: valid_params }
          expect(response).to redirect_to(root_path)
        end
      end

      context "with invalid parameters" do
        it "does not create a new Diet" do
          expect {
            post diets_url, params: { diet: invalid_params }
          }.to change(Diet, :count).by(0)
        end

        it "renders a successful response (i.e. to display the 'new' template)" do
          post diets_url, params: { diet: invalid_params }
          expect(response).to be_successful
        end
      end
    end

    describe "update" do
      context "with valid parameters" do
        let(:new_attributes) { 
          attributes_for(
            :diet, 
            initial_weight_attributes: { value: 2.2, unity: "kg" }, 
            ideal_weight_attributes:   { value: 2.2, unity: "kg" }, 
            user_id: user.id
          ) 
        }

        it "updates the requested diet" do
          diet = Diet.create! valid_params
          patch diet_url(diet), params: { diet: new_attributes }
          diet.reload
          expect(response).to be_successful
        end
      end
    end

    describe "destroy" do
      it "destroys the requested diet" do
        diet = Diet.create! valid_params
        expect {
          delete diet_url(diet)
        }.to change(Diet, :count).by(-1)
      end

      it "redirects to the diets list" do
        diet = Diet.create! valid_params
        delete diet_url(diet)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end