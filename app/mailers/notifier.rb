class Notifier < ActionMailer::Base
  default from: "from@example.com"

  def story_created_notification(story)
  	@story = story

  	mail :to => 'umajoshi@yahoo.com', :subject => "You've got a story"	
  end

end
