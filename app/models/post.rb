require 'digest'

class Post < ActiveRecord::Base
  attr_accessible :text, :password

  belongs_to :topic
  belongs_to :parent, class_name: "Post"
  has_many :children, class_name: "Post", foreign_key: "parent_id"

  def password= p
    if p
      # TODO: Implement real salt and more secure hash function
      self.password_hash = Digest::SHA1.hexdigest("salty" + p) 
    else
      self.password_hash = nil
    end
  end

  validates :text, presence: true
  validates :topic, presence: true
end
