module ProductsHelper

	#Translates true to Active and false to Deactive
	def status(product)
		if product.active == true
			return "Active"
		else
			return "Deactive"
		end
	end
	
	def yes_no_status(product)
		if product.active == true
			return "Yes"
		else
			return "No"
		end
	end

	


end
