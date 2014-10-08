class Job < ActiveRecord::Base
=begin
 attr_accessible :job_id, :title, :description, :tag1, :tag2, :tag3, :category, :deadline
=end
belongs_to :employer
belongs_to :category
  def category
    category_name
  end
end
