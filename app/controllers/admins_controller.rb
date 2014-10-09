class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
  end



  # GET /admins/new
  def new
    if((cookies[:adminID]=="") || (cookies[:adminID].is_a?NilClass))
      @custom_error = "Please login as admin to create new admin"
      render "layouts/error"
      return
    end
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    if((cookies[:adminID]=="") || (cookies[:adminID].is_a?NilClass))
      @custom_error = "Insufficient Rights.Please login as admin!"
      render "layouts/error"
      return
    end
    if((@admin.email=="ad.direwolf.min@gmail.com"))
      @custom_error = "Action Not Allowed !   This is a super-admin. Please create sample Admin and perform this action"
      render "layouts/error"
      return
      end
  end

  # POST /admins
  # POST /admins.json
  def create
    # render plain: admin_params
    # return

    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        UserNotifier.send_signup_email(@admin).deliver
        format.html { redirect_to @admin, notice: 'Admin was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    if((@admin.email=="ad.direwolf.min@gmail.com"))
      @custom_error = "Action Not Allowed !   This is a super-admin. Please create sample Admin and perform this action"
      render "layouts/error"
      return
    end
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    if((@admin.email=="ad.direwolf.min@gmail.com"))
      @custom_error = "Action Not Allowed !   This is a super-admin. . Please create sample Admin and perform this action"
      render "layouts/error"
      return
    end
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_url, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end
end
