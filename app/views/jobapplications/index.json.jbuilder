json.array!(@jobapplications) do |jobapplication|
  json.extract! jobapplication, :id, :job_id, :jobseeker_id, :coverletter, :status
  json.url jobapplication_url(jobapplication, format: :json)
end
