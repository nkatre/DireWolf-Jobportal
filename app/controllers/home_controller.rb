class HomeController < ApplicationController
  def index

  end
  def login
    render "layouts/login", :layout => true
  end

  def logout
    cookies[:adminID]=""
    cookies[:employerID]=""
    cookies[:jobseekerID]=""
    redirect_to :back
  end
=begin
  def invalid_credentials
    render "layouts/invalid_credentials", :layout => true
  end
=end
  def login_check

    @email=params[:login_email]

    @password = params[:login_password]

    @title = params[:theme]

    if(@title=='Admin')
      @admin=Admin.find_by_email(@email)
      if(@admin.is_a?NilClass)
        render "layouts/invalid_credentials", :layout => true
        return
      else
        if(@admin.password==@password)
          cookies[:adminID] = @admin.id
          redirect_to @admin, :layout => true
          return
        else
          render "layouts/invalid_credentials", :layout => true
          return
        end
      end


    elsif(@title=='Jobseeker')
      @jobseeker=Jobseeker.find_by_email(@email)
      if(@jobseeker.is_a?NilClass)
        render "layouts/invalid_credentials", :layout => true
        return
      else
        if(@jobseeker.password==@password)
          cookies[:jobseekerID] = @jobseeker.id
          redirect_to @jobseeker, :layout => true
          return
        else
          render "layouts/invalid_credentials", :layout => true
          return
        end
      end

    elsif (@title=='Employer')
      @employer=Employer.find_by_email(@email)
      if(@employer.is_a?NilClass)
        render "layouts/invalid_credentials", :layout => true
        return
      else
        if(@employer.password==@password)
          cookies[:employerID] = @employer.id
          redirect_to @employer, :layout => true
          return
        else
          render "layouts/invalid_credentials", :layout => true
          return
        end
      end
    end
  end
end