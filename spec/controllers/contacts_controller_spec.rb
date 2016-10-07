require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  let (:contact) { FactoryGirl.create(:contact) }

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end
    it "assigns the contact instance variable" do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end
  end

  describe "#create" do
    context "with valid attributes" do
      def valid_request
        post :create, contact: {name: "Yat",
                                email: "yat@m.com",
                                message: "Test",
                                address: "8180 Bennett Road,Richmond",
                                amount: 10}
      end

      it "creates a record in the database" do
        count_before = Contact.count
        valid_request
        count_after = Contact.count
        expect(count_after).to eq(count_before +1)
      end

      it "sends an e-mail" do
        expect { valid_request }.to change{ActionMailer::Base.deliveries.count}.by(1)
      end

    end
  end



end
