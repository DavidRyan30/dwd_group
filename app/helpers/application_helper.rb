module ApplicationHelper

	def full_title(title)
		base_title = "ShoppingApp"
		if title.empty?
			base_title
		else
			"#{base_title} | #{title}"
		end
	end
end
