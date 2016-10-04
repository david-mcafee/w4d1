class ContactsControllerController < ApplicationController
  def index
    contact = Contact.all
    render json: contact
  end

#   def create_contact(name, email)
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/contacts.json'
#   ).to_s
#
#   puts RestClient.post(
#     url,
#     { contact: { name: name, email: email } }
#   )
# end
#
# create_contact("Gizmo", "gizmo@gizmo.gizmo")

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    # debugger
    contact = Contact.find(params[:id])
    if contact
      render json: contact
    else
      render(
        json: contact.errors.full_messages
      )
    end
  end

  def update
    contact = Contact.find(params[:id])

    if contact.update!(contact_params)
      render json: contact
    else
      render(
        json: contact.errors.full_messages
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    if contact.destroy!
      render json: contact
    else
      render(
        json: contact.errors.full_messages
      )
    end
  end


  private
  def contact_params
    params[:contact].permit(:name, :email)
  end
end
