class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_employee, only: [:index, :show, :edit, :update, :destroy]
  before_action :correct_employee,   only: [:show, :edit, :update]
  before_action :admin_employee,     only: :destroy

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.paginate(page: params[:page])
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @phones = @employee.phones

  end

  # GET /employees/new
  def new
  #  @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)
    @employee = Employee.new
    @employee.assignments.build{ |a| a.build_role }
  end

  # GET /employees/1/edit
  def edit
     @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      @employee.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        flash[:success] = "Profile updated"
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    Employee.find(params[:id]).destroy
    flash[:success] = "Employee deleted"
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end
    
        # Confirms a logged-in user.
    def logged_in_employee
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
        # Confirms the correct user.
    def correct_employee
      @employee = Employee.find(params[:id])
      redirect_to(root_url) unless current_employee?(@employee)
    end
    
        # Confirms an admin user.
    def admin_employee
      redirect_to(root_url) unless current_employee.admin?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:avatar, :email, :first_name, :last_name, :service_no, :password, :date_of_birth, :gender, :service_start_date, :substantive_rank, :promotion_date, :passport_number, :passport_expiry, :passport_country_of_origin, :nationality, :national_insurance, assignments_attributes: [:id, :start_date, :end_date, roles_attributes: [:id, :pid, :description]] )
    end
end
