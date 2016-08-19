module PageWithTopTenPosts
	include Gizmo::PageMixin

	def valid?
		has_css?('.top-10-container .top-10-list')
	end

	def posts_in_top_ten_list
		find('.top-10-list').all('li')
	end
end