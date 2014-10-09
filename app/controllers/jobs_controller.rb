class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    if(@jobs.count==0)
      @custom_notification = "No jobs to show"
      render "layouts/notifications"
      return
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    if((cookies[:employerID]=="")||(cookies[:employerID].is_a?NilClass))
      @custom_error = "Insufficient Rights. Please login as employer !"
      render "layouts/error"
      return
    end
    @employer = Employer.find(cookies[:employerID].to_i)
    @job.employer_id=@employer.id
  end

  def recommendation
    @jobs = []
    Jobapplication.where(:jobseeker_id => cookies[:jobseekerID]).to_a.each do |app|
      job = Job.find(app.job_id)
      @jobs += Job.where(:tag1 => job.tag1)
      @jobs += Job.where(:tag2 => job.tag2)
      @jobs += Job.where(:tag3 => job.tag3)
      @jobs.delete job
    end
    @jobs.uniq!
    if(@jobs.count==0)
      @custom_notification = "No recommended jobs to show SINCE
      you have not applied to any job previously OR
      you have deleted all your previous job applications.
      Recommended jobs are found, by matching tags(tag1, tag2, tag3) of the job with your job applications."
      render "layouts/notifications"
      return
    elsif (@jobs.count!=0)
      render :index
    end
  end


  def search
    @jobs=[]
    @searchStr = params[:search] if (@searchStr.is_a? NilClass)
    if(@searchStr=="")
      @jobs = Job.all
    elsif
    @searchStr.split.each do |word|
      Job.find_each do |job|
        if(( (job.title =~ /#{"(.*)"+word+"(.*)"}/i) == 0) ||
        ((job.tag1 =~ /#{"(.*)"+word+"(.*)"}/i) == 0) ||((job.tag2 =~ /#{"(.*)"+word+"(.*)"}/i) == 0) ||((job.tag3 =~ /#{"(.*)"+word+"(.*)"}/i) == 0)||
        ((job.category =~ /#{"(.*)"+word+"(.*)"}/i) == 0))
                    @jobs << job
        end
      end
    end
    end
    @jobs.uniq!
    if(@jobs.count==0)
      @custom_notification = "No such job found"
      render "layouts/notifications"
      return
    elsif (@jobs.count!=0)
      render :index
    end
  end


  # GET /jobs/1/edit
  def edit

    if((cookies[:employerID]=="")||(cookies[:employerID].is_a?NilClass))
      @custom_error = "Insufficient Rights. Please login as employer !"
      render "layouts/error"
      return

    end
    @job.category_name = Category.find_by_name(@job.category_name).id
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)
    @job.category_name = Category.find(@job.category_name.to_i).name
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    params[:job][:category_name] = Category.find(params[:job][:category_name]).name
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    if((cookies[:employerID]=="")||(cookies[:employerID].is_a?NilClass))
      @custom_error = "Insufficient Rights. Please login as employer !"
      render "layouts/error"
      return
    end
    Jobapplication.find_each do |app|
      Jobapplication.delete(app) if app.job_id == @job.id
    end
    @job.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_id, :title, :description, :tag1, :tag2, :tag3, :category_name, :deadline, :employer_id)
    end

  def error_span(attribute)
    @template.content_tag :span, errors_for(attribute), class: 'help-inline'
  end
end
