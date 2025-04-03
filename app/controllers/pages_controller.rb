class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def contact
    @contact = Contact.new
  end

  def create_contact
    @contact = Contact.new(contact_params)
  
    if @contact.save
      redirect_to root_path, notice: 'Contact was successfully submited.'
    else
      render :contact
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
