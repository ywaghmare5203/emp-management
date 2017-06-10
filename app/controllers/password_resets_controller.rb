class PasswordResetsController < ApplicationController
  before_action :get_employee,   only: [:edit, :update]
  before_action :valid_employee, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]
  
  def new
  end
  
  def create
    @employee = Employee.find_by(service_no: params[:password_reset][:service_no].downcase)
    if @employee
      @employee.create_reset_digest
      @employee.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Service number not found"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @employee.update_attributes(employee_params)
      log_in @employee
      flash[:success] = "Password has been reset."
      redirect_to @employee
    else
      render 'edit'
    end
  end
  
  private
  
   def user_params
      params.require(:employee).permit(:password, :password_confirmation)
    end

    # Returns true if password is blank.
    def password_blank?
      params[:employee][:password].blank?
    end
    
    # Before filters

    def get_employee
      @employee = Employee.find_by(email: params[:email])
    end

    # Confirms a valid user.
    def valid_employee
      unless (@employee && @employee.activated? &&
              @employee.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end
    
    # Checks expiration of reset token.
    def check_expiration
      if @employee.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
