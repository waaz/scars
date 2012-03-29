class UsersController < ApplicationController
 def index
  if current_user && current_user.is_admin?
   @users = User.all
  else
   if current_user
    redirect_to user_path(current_user.id)
   else
    redirect_to root_url
   end
  end
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
   session[:user_id] = @user.id
   if @user.is_admin?
    redirect_to "/admin"
   else
    redirect_to bookings_path
   end
  else
   render 'new'
  end
 end

 def show
  if current_user
   if current_user.is_admin? && params[:id]
    @user = User.find(params[:id])
    @customer = @user.customer
   else
    @user = current_user
    if current_user.id != params[:id].to_i
     redirect_to user_path(@user.id)
    end
    @customer = @user.customer
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
    if @user.id != params[:id].to_i
     redirect_to edit_user_path(@user.id)
    end
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
     redirect_to users_url
    else
     redirect_to users_url, notice: "Cannot delete current user!"
    end
  else
   redirect_to root_url, notice: "Unauthorised!" 
  end
 end
 end
end
