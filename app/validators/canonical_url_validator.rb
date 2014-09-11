class CanonicalURLValidator < ActiveModel::EachValidator

def self.exists?(url)
	story = Story.new(:url => url)
	story.valid?
	story.errors[:url].any?
end

	def validate_each(record, attribute, url)
		url = url_without_protocol(url)
		url = url_without_www(url)
		url = url_without_trailining_slash(url)

		if record.class.where("#{attribute} LIKE ?", "%#{url}").exists?
			record.errors.add(attribute, "has already been posted! #dupdetector")
		end
	end

protected
	def url_without_protocol(url)
		url.gsub(/https?:\/\//,'')
		
	end

	def url_without_www(url)
		url.gsub('www','')

	end

	def url_without_trailining_slash(url)
		if url.ends_with?('/')
			url[0...-1]
		else
			url
		end
	end
end
