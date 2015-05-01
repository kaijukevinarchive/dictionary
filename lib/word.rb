class Word
	attr_reader(:word_entry, :definition_list)
	@@word_list = []

	define_method(:initialize) do |attributes|
		@word_entry = attributes.fetch(:word_entry)
		@definition_list = []
	end

	define_singleton_method(:clear) do
		@@word_list = []
	end

	define_method(:save) do
		@@word_list.push(self)
	end

	define_singleton_method(:all) do 
		@@word_list
	end

	define_method(:add_definition) do |definition|
		@definition_list.push(definition)
	end
end