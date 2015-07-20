def dataTypes(obj_to_check)
	case obj_to_check.class.to_s
	when "String" then return obj_to_check.length
	when "NilClass" then return "no value"
	when "TrueClass" || "FalseClass" then return obj_to_check
	when "Fixnum" then return obj_to_check < 100 ? "less than 100" : pbj_to_check == 100 ? "equal to 100" : "more than 100"
	when "Array" then	return obj_to_check.length >= 3 ? obj_to_check[2] : nil
	end	
end