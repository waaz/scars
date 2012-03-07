class CustomersController < ApplicationController
def index
  if current_user && current_user.is_admin?
   @customers = Customer.all
  else
   redirect_to root_url, notice: "Unauthorised."
  end
 end

 def show
  if current_user
   if current_user.is_admin? && params[:id]
    @customer = Customer.find(params[:id])
   else
    @user = current_user
    @customer = @user.customer
   end
  else
   redirect_to root_url, notice: "Unauthorised!" 
  end
 end
 
 def edit
   if current_user
    if current_user.is_admin? && params[:id]
     @customer = Customer.find(params[:id])
    else
     redirect_to root_url, notice: "Unauthorised!" 
   end
  end
 end
 
 def update
  @customer = Customer.find(params[:id])
  if @customer.update_attributes(params[:customer])
   redirect_to customers_url, notice: 'Details were successfully updated.'
  else
   render action: "edit"
  end
 end
end
