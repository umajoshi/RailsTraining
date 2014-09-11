class CanonicalURLValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, url)
		cleaned_up_url = url.gsub(/https?:\/\//,'')
		cleaned_up_url.gsub! 'www.',''
		cleaned_up_url = cleaned_up_url[0...-1] if cleaned_up_url.ends_with?('/')

		if Story.where('url LIKE ?', "%#{cleaned_up_url}").exists?
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
