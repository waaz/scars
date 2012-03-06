class UsersController < ApplicationController
 def index
  @users = User.all
 end

 def new
  if current_user
   redirect_to root_url, notice: "Already logged in."
  else
   @user = User.new
  end
 end

 def create
  @user = User.new(params[:user])

  if @user.save
   @customer = Customer.create(user_id: @user.id) unless @user.is_admin?
   session[:user_id] = @user.id unless current_user.is_admin?
   redirect_to user_path(@user.id)
  else
   render 'new'
  end
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
   @user = User.find(params[:id])
   
   if params[:user][:email]
	redirect_to edit_user_path, notice: "Cannot modify email address"
   else 	
	 if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
     else
      render action: "edit"
    end
   end
 end
 
 def destroy
  if current_user
   if current_user.is_admin?
    @user = User.find(params[:id])
	if not current_user.id == @user.id
     @user.destroy
     redirect_to "users#index"
	else
	 redirect_to root_url, notice: "Cannot delete current user!"
    end
   end
  else
	redirect_to root_url, notice: "Unauthorised!" 
  end
 end
end