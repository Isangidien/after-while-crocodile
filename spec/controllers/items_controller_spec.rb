require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  #before(:each) do
  #  @user = FactoryGirl.create(:user, email: Faker::Internet.email)
  #  sign_in @user
  #end

  let(:my_item) { create(:item, user: @user) }



  describe "POST create" do

    it "increases the number of items by 1" do
      expect{ post :create, item: {name: Faker::App.name }}.to change(Item, :count).by(1)
    end

    it "returns HTTP status found" do
      post :create, id: my_item.id, item: {name: Faker::App.name }
      expect(response).to have_http_status(:found)
    end
  end

  describe "DELETE destroy" do
    it "deletes the comment" do
      delete :destroy, format: :js, user_id: @user.id, id: my_item.id
      count = Item.where({id: my_item.id}).count
      expect(count).to eq 0
    end

    it "redirects to the user show view" do
      delete :destroy, format: :js, user_id: @user.id, id: my_item.id
      expect(response).to have_http_status(:success)
    end
  end

end
