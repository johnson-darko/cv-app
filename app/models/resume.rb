class Resume < ApplicationRecord
	belongs_to :user
  
  
  has_attached_file :avatar,
                    :styles => {
                        :small => "150x150#",
                        :large => "242x200#"
                    }
  #validates :name, presence: true,
            #length: {minimum: 5}
  #validates :general_info, presence: true,
            #length: {minimum: 10}
  #validates :avatar, presence: true
  #validates :interests,
            #length: {minimum: 5}
  validates :user_id, presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]

  # def to_param
  #   [id, name.parameterize].join('-')
  # end
end
