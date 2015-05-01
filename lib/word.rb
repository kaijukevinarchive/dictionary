class Word
	attr_reader(:word_entry, :definition_list, :id)
	@@words_list = []

	define_method(:initialize) do |attributes|
		@word_entry = attributes.fetch(:word_entry)
		@definition_list = []
		@id = @@words_list.length + 1
	end

	define_singleton_method(:clear) do
		@@words_list = []
	end

	define_method(:save) do
		@@words_list.push(self)
	end

	define_singleton_method(:all) do 
		@@words_list
	end

	define_method(:add_definition) do |definition|
		new_definition = Definition.new(:definition_entry => definition)
		@definition_list.push(new_definition)
	end

	define_singleton_method(:find) do |id_number|
		found_word = nil
		@@words_list.each() do |word|
			if word.id() == id_number
				found_word = word
			end
		end
		found_word
	end
end