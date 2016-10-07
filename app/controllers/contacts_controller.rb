class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    contact_params = params.require(:contact).permit(:name, :message, :email)
    @contact = Contact.new contact_params
    if @contact.save
      ContactsMailer.notify_owner(@contact).deliver_now
      redirect_to root_path, notice: "Successfully delivered message"
    else
      redirect_to root_path, notice: "An error occured"
    end
  end

  def index
    
  end

end
