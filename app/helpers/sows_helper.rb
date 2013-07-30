module SowsHelper
	def exclude_column(col)
		result = case col
		   when "id" then false
		   when "created_at" then false
		   when "updated_at" then false
		   when "status" then false
		   when "version" then false
		   when "sow_id" then false
		   else true
		end
		return result
	end
end
