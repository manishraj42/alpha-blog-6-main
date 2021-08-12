module ApplicationHelper

	def gravatar_for(user, options = {size: 200})
		email_address = user.email.downcase
		hash = Digest::MD5.hexdigest(email_address)
		size = options[:size]
		gravatar_url = image_src = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
	end

	def flash_class(level)
		bootstrap_alert_class = {
			"success" => "alert-success",
			"error" => "alert-danger",
			"notice" => "alert-info",
			"alert" => "alert-danger",
			"warn" => "alert-warning"
		}
		bootstrap_alert_class[level]
	end

	
end
