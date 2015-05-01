class Definition 
	attr_reader(:definition_entry)

	define_method(:initialize) do |attributes|
			@definition_entry = attributes.fetch(:definition_entry)
	end
end