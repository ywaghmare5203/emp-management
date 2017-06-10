class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(service_no: params[:session][:service_no])
    if employee && employee.authenticate(params[:session][:password])
      if employee.activated?
        log_in employee
        params[:session][:remember_me] == '1' ? remember(employee) : forget(employee)
        redirect_back_or employee
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
      # Log the employee in and redirect to the employee's show page.
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid Service Number/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
