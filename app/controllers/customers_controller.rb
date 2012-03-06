class CustomersController < ApplicationController
def index
  @customers = Customer.all
 end

 def show
  if current_user
   if current_user.is_admin? && params[:id]
    @user = User.find(params[:id])
    @customer = Customer.where(user_id: @user.id).first
   else
    @user = current_user
    @customer = Customer.where(user_id: current_user.id).first
   end
  else
   redirect_to root_url, notice: "Unauthorised!" 
  end
 end
 
 def edit
  if current_user
   if current_user.is_admin? && params[:id]
    @user = User.find(params[:id])
    @customer = Customer.where(user_id: @user.id).first
   else
    @user = current_user
    @customer = Customer.where(user_id: current_user.id).first
   end
  else
   redirect_to root_url, notice: "Unauthorised!" 
  end
 end
 
 def update
    @customer = Customer.find(params[:id])
	@user = User.find(@customer.user_id)
	if @customer.update_attributes(params[:customer])
     redirect_to @user, notice: 'Details were successfully updated.'
    else
     render action: "edit"
    end
 end
end