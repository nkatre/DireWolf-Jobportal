class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  # GET /employers
  # GET /employers.json
  def index
    @employers = Employer.all
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
    if((cookies[:adminID]=="")||(cookies[:adminID].is_a?NilClass))
      @custom_error = "Insufficient Rights. Please login as admin!"
      render "layouts/error"
      return
    end
    @admin = Admin.find(cookies[:adminID].to_i)
    @employer.admin_id=@admin.id
  end

  # GET /employers/1/edit
  def edit
    if((cookies[:adminID]=="")||(cookies[:adminID].is_a?NilClass))
      @custom_error = "Insufficient Rights.Please login as admin!"
      render "layouts/error"
      return
    end
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)

    respond_to do |format|
      if @employer.save
        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render :show, status: :created, location: @employer }
      else
        format.html { render :new }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    if((cookies[:adminID]=="")||(cookies[:adminID].is_a?NilClass))
      @custom_error = "Insufficient Rights.Please login as admin!"
      render "layouts/error"
      return
    end
=begin
    @allJobs = Job.find.all.each do |thisJob|
      Jobapplication.find_each do |app|
        Jobapplication.delete(app) if app.job_id == thisJob.job_id
      end
    end
=end
=begin
    Job.find_each do |job|
      Job.delete(job) if job.employer_id == @employer.id
    end
=end
    @employer.destroy
    respond_to do |format|
      format.html { redirect_to employers_url, notice: 'Employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:company_name, :contact_name, :email, :password, :admin_id)
    end
end
