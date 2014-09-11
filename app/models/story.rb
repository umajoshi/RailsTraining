class Story < ActiveRecord::Base
  belongs_to :user

  attr_readonly :url, :author

  validates :url, :title, :author,
  :presence => { :message => 'must not be blank'}

  validates :url,
  :canonical_url => true,
  :format => /https?:\/\/[\S]+/,
  :presence => true,
  :on => :create


after_create :send_admin_an_email

protected
	def send_admin_an_email		
		Notifier.story_created_notification(self).deliver
	end
end
