class Upload < ActiveRecord::Base
belongs_to :user 

	#self.primary_key = "user_id"
	#belongs_to :user,:foreign_key => "user_id"
	#validates :user_id, :presence => true
	#play around with attr_accessible
	#paperclip  uploaded
	has_attached_file :uploaded
	#validates_attachment_presence :uploaded


end
# == Schema Information
#
# Table name: uploads
#
#  id                    :integer         not null, primary key
#  created_at            :datetime
#  updated_at            :datetime
#  uploaded_file_name    :string(255)
#  uploaded_content_type :string(255)
#  uploaded_file_size    :integer
#  uploaded_updated_at   :datetime
#  user_id               :integer
#

