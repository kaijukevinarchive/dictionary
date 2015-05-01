class Definition 
	attr_reader(:entry)

	define_method(:initialize) do |attributes|
			@entry = attributes.fetch(:entry)
	end
end