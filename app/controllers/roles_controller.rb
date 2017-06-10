class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]


  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.order("created_at")
    @role = Role.new
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    @role = Role.find(params[:id])
    @employee = @role.employees
  end

  # GET /roles/new
  def new
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def new_parent
    @role = Role.new(:child_id => params[:child_id])
  end

  def new_child
    @role = Role.new(:parent_id => params[:parent_id])
  end
  
  def ancestry_options(items, &block)
      return ancestry_options(items){ |i| "#{'-' * i.depth} #{i.name}" } unless block_given?

      result = []
      items.map do |item, sub_items|
        result << [yield(item), item.id]
        #this is a recursive call:
        result += ancestry_options(sub_items, &block)
      end
      result
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_params
      params.require(:role).permit(:employee_id, :pid, :description, :ancestry, :section, :parent_id, :assignments_attributes => [:employee_id, :role_id, :start_date, :employees_attributes => [:id, :role_id, :first_name, :last_name]])
    end
end
