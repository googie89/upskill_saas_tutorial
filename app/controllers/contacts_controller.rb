class ContactsController < ApplicationController
    def new
      @contact = Contact.new
    end
    
    def create
      @contact = Contact.new(contact_params)
      if @contact.save
        #ContactMailer.contact_email(@contact.name, @contact.email, @contact.comments).deliver
        flash[:success] = "Message sent. ;) no it´s just a Development test."
      else
         flash[:error] = @contact.errors.full_messages.join(", ")
      end
      redirect_to new_contact_path
    end
    
    private
      def contact_params
        params.require(:contact).permit(:name, :email, :comments)
      end
end