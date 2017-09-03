class ContactsController < ApplicationController
  def create
    Contact.create(contact_params)
    company = Company.find(contact_params[:company_id])
    redirect_to company_path(company.slug)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :title, :email, :company_id)
  end
end
