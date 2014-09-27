json.array!(@jobseekers) do |jobseeker|
  json.extract! jobseeker, :id, :name, :email, :password, :phone, :skills, :resume
  json.url jobseeker_url(jobseeker, format: :json)
end
