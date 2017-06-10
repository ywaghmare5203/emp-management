class AssignmentsController < ApplicationController
	
	def index
		@assignment = Assignment.all
		@role = Assignment.roles
	end

	def new
		@roles = Role.all
		@employee = Employee.all
	end

	def create
		@assignment = @employee.assignments.build(:role_id => params[:role_id])
		if @assignment.save
	      flash[:info] = "The employee's role has been updated."
	      redirect_to employees_url
    	else
      	  render 'new'
    	end
    end

    def destroy
    	@assignment = Assignment.find(params[:id]).destroy
    flash[:success] = "Employee's role was removed"
	    respond_to do |format|
	      format.html { redirect_to employees_url, notice: "Employee's role was successfully removed." }
	      format.json { head :no_content }
	    end
  	end

end
