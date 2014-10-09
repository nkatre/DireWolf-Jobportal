class JobseekersController < ApplicationController
  before_action :set_jobseeker, only: [:show, :edit, :update, :destroy]

  # GET /jobseekers
  # GET /jobseekers.json
  def index
    @jobseekers = Jobseeker.all
  end

  # GET /jobseekers/1
  # GET /jobseekers/1.json
  def show
  end

  def view_my_applications
    @jobapplications = Jobapplication.where(:jobseeker_id => cookies[:jobseekerID])
    if(@jobapplications.count==0)
      @custom_notification = "You have not applied to any job OR You have deleted all your previous job applications"
      render "layouts/notifications"
      return
    elsif (@jobapplications.count!=0)
      render 'jobapplications/index'
    end
  end

  # GET /jobseekers/new
  def new
    @jobseeker = Jobseeker.new

  end

  # GET /jobseekers/1/edit
  def edit
    if((@jobseeker.email=="jobs.direwolf.eeker@gmail.com"))
      @custom_error = "Action Not Allowed ! This is a SYSTEM DEFINED Jobseeker. Please create sample Jobseeker and perform this action"
      render "layouts/error"
      return
    end
  end

  # POST /jobseekers
  # POST /jobseekers.json
  def create
    @jobseeker = Jobseeker.new(jobseeker_params)

    respond_to do |format|
      if @jobseeker.save
        UserNotifier.send_signup_email(@jobseeker).deliver
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully created.' }
        format.json { render :show, status: :created, location: @jobseeker }
      else
        format.html { render :new }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobseekers/1
  # PATCH/PUT /jobseekers/1.json
  def update
    if((@jobseeker.email=="jobs.direwolf.eeker@gmail.com"))
      @custom_error = "Action Not Allowed ! This is a SYSTEM DEFINED Jobseeker. Please create sample Jobseeker and perform this action"
      render "layouts/error"
      return
    end
    respond_to do |format|
      if @jobseeker.update(jobseeker_params)
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobseeker }
      else
        format.html { render :edit }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobseekers/1
  # DELETE /jobseekers/1.json
  def destroy
    if((@jobseeker.email=="jobs.direwolf.eeker@gmail.com"))
      @custom_error = "Action Not Allowed ! This is a SYSTEM DEFINED Jobseeker. Please create sample Jobseeker and perform this action"
      render "layouts/error"
      return
    end
    @jobseeker.destroy
    respond_to do |format|
      format.html { redirect_to jobseekers_url, notice: 'Jobseeker was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobseeker
      @jobseeker = Jobseeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobseeker_params
      params.require(:jobseeker).permit(:name, :email, :password, :phone, :skills, :resume)
    end
end
