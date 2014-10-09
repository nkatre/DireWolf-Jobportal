class Employer < ActiveRecord::Base
  has_many :jobs
  belongs_to :admin

  def name
    contact_name
  end
end
