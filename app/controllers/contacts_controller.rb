class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    contact_params = params.require(:contact).permit(:name, :message, :email, :address, :amount)
    @contact = Contact.new contact_params
    if @contact.save
      redirect_to new_contact_charge_path(@contact)
      ContactsMailer.notify_owner(@contact).deliver_now
    else
      redirect_to new_contact_path, notice: "An error occured"
    end
  end

  def index
    @contacts = Contact.near("Vancouver, BC", 30, units: :km)
    @markers_hash = Gmaps4rails.build_markers(@contacts) do |contact, marker|
      marker.lat contact.latitude
      marker.lng contact.longitude
      marker.infowindow contact.message
    end
  end

end
