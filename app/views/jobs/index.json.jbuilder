json.array!(@jobs) do |job|
  json.extract! job, :id, :job_id, :title, :description, :tag1, :tag2, :tag3, :category, :deadline, :employer_id
  json.url job_url(job, format: :json)
end
