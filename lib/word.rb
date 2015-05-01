class Word
	attr_reader(:word_entry)

	define_method(:initialize) do |attributes|
		@word_entry = attributes.fetch(:word_entry)
	end
end