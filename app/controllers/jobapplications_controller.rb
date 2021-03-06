class JobapplicationsController < ApplicationController
  before_action :set_jobapplication, only: [:show, :edit, :update, :destroy]

  # GET /jobapplications
  # GET /jobapplications.json
  def index
    @jobapplications = Jobapplication.all
  end


  def list_applications
    @jobapplications = Jobapplication.where(:job_id=>params[:job_id]).to_a
    render 'index'
  end

  def list_apps
    @jobapplications = []
    Job.where(:employer_id => params[:employer_id].to_i).to_a.each do|job|
      @jobapplications += Jobapplication.where(:job_id => job.id).to_a
    end
    if(@jobapplications.count==0)
      @custom_notification = "No job application to show"
      render "layouts/notifications"
      return
    elsif (@jobapplications.count!=0)
      render :index
    end
  end

  # GET /jobapplications/1
  # GET /jobapplications/1.json
  def show
  end

  # GET /jobapplications/new
  def new
    @jobapplication = Jobapplication.new
    @jobapplication.job_id=params[:job_id].to_i
    if((cookies[:jobseekerID]=="")||(cookies[:jobseekerID].is_a?NilClass))
      @custom_error = "Please login as Jobseeker !"
      render "layouts/error"
      return
    end
    @jobseeker= Jobseeker.find(cookies[:jobseekerID].to_i)
    @jobapplication.jobseeker_id=@jobseeker.id
    @jobapplication.status="Pending"
  end

  # GET /jobapplications/1/edit
  def edit
    if((cookies[:adminID]!="") && !(cookies[:adminID].is_a?NilClass))
      @custom_error = "Please login as Jobseeker !"
      render "layouts/error"
      return
    end

  end

  # POST /jobapplications
  # POST /jobapplications.json
  def create
    @jobapplication = Jobapplication.new(jobapplication_params)

    respond_to do |format|
      if @jobapplication.save
        @foundjob = Job.find(@jobapplication.job_id)
        @foundemployerid = @foundjob.employer_id.to_i
        @foundemployer = Employer.find(@foundemployerid)
        UserNotifier.jobapplication_submitted_email(@foundemployer).deliver
        format.html { redirect_to @jobapplication, notice: 'Jobapplication was successfully created.' }
        format.json { render :show, status: :created, location: @jobapplication }
      else
        format.html { render :new }
        format.json { render json: @jobapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobapplications/1
  # PATCH/PUT /jobapplications/1.json
  def update
    respond_to do |format|
      if @jobapplication.update(jobapplication_params)
        if((cookies[:employerID]!="") && (!cookies[:employerID].is_a?NilClass))
           @foundjobseeker = Jobseeker.find(@jobapplication.jobseeker_id)
           UserNotifier.jobapplication_status_update_email(@foundjobseeker).deliver
        end
        format.html { redirect_to @jobapplication, notice: 'Jobapplication was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobapplication }
      else
        format.html { render :edit }
        format.json { render json: @jobapplication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobapplications/1
  # DELETE /jobapplications/1.json
  def destroy
    if((cookies[:jobseekerID]=="")||(cookies[:jobseekerID].is_a?NilClass))
      @custom_error = "Please login as Jobseeker !"
      render "layouts/error"
      return
    end
    @jobapplication.destroy
    respond_to do |format|
      format.html { redirect_to jobapplications_url, notice: 'Jobapplication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobapplication
      @jobapplication = Jobapplication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobapplication_params
      params.require(:jobapplication).permit(:job_id, :jobseeker_id, :coverletter, :status)
    end
end
