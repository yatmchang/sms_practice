require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do

    it "requires a name" do
      c = Contact.new FactoryGirl.attributes_for(:contact).merge({name: nil})
      expect(c).to be_invalid
    end

    it "requires an email" do
      c = Contact.new FactoryGirl.attributes_for(:contact).merge({email: nil})
      expect(c).to be_invalid
    end
    it "requires a message" do
      c = Contact.new FactoryGirl.attributes_for(:contact).merge({message: nil})
      expect(c).to be_invalid
    end
    it "requires an amount" do
      c = Contact.new FactoryGirl.attributes_for(:contact).merge({amount: nil})
      expect(c).to be_invalid
    end
    it "requires an address" do
      c = Contact.new FactoryGirl.attributes_for(:contact).merge({address: nil})
      expect(c).to be_invalid
    end

    it "creates a single pin of V6B 1G8" do
      c = Contact.create FactoryGirl.attributes_for(:contact)
      expect(c.latitude.round(2)).to eq(49.28)
    end

    it "doesn't create a pin with invalid address" do
      c = Contact.create FactoryGirl.attributes_for(:contact).merge({address: "invalid address" })
      expect(c.latitude).not_to be
    end
  end
end
