class UserDocument < ApplicationRecord
  belongs_to :user
  has_attached_file :file
  validates_attachment_content_type :file,
                                    content_type: ['application/pdf', 'application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'image/jpeg', 'image/gif', 'image/png', 'image/jpg', 'image/bmp', 'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']
  validates_presence_of :file, on: :create, message: "can't be blank"

  # def to_jq_upload
  #   {
  #     "name" => read_attribute(:file_file_name),
  #     "size" => read_attribute(:file_file_size),
  #     "url" => file.url(:original),
  #     "delete_url" => upload_documents_path(self),
  #     "delete_type" => "DELETE"
  #   }
  # end
end
