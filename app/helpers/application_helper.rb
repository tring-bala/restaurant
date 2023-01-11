module ApplicationHelper
	def page
		params[:page].to_i > 0 ? params[:page].to_i : 1
	end

	def per_page
		params[:per_page].to_i > 0 ? params[:per_page].to_i : AppConstant::PAGINATE_PER_PAGE
	end

	def title(page_title)
	  content_for :title, page_title.to_s
	end

	def page_name(page_name)
	  content_for :page_name, page_name.to_s
	end
end
