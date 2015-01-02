class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all.order(:name)
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.create(contact_params)
    if @contact.save
      redirect_to contacts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update_attributes(contact_params)
      redirect_to @contact
    else
      render :edit
    end
  end

  def destroy
    @contact.delete
    redirect_to contacts_path
  end

  private

    def contact_params
      params.require(:contact).permit(:name, :email, :phone_number)
    end

    def set_contact
      @contact = Contact.find(params[:id])
    end
end
