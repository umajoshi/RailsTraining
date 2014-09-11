module StoriesHelper


	def link_to_edit_story(story = @story, &block)
		if current_user == story.user
			#link_to('Edit', edit_story_path(story)) 
			link_to(edit_story_path(story), &block)
		end
	end


	def link_to_delete_story(story = @story)
		if current_user == story.user
			link_to('Destroy', story, method: :delete, data: { confirm: 'Are you sure?' }) 
		end
	end


end
