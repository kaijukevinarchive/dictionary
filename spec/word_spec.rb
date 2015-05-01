require('rspec')
require('word')
require('definition')

# Words should be able to hold multiple definitions
describe(Word) do

	before do
		Word.clear()
	end
	
	# Should be a word
	describe('#initialize') do
		it("returns the word") do
			my_word = Word.new({:word_entry => 'Toast'})
			expect(my_word.word_entry()).to(eq('Toast'))
		end
	end
	
	# Should save the word in a list
	describe('#save') do
		it("saves the word into an array") do 
			my_word = Word.new({:word_entry => 'Toast'})
			my_word.save()
			expect(Word.all()).to(eq([my_word]))
		end

		it("holds multiple words") do
			my_word = Word.new({:word_entry => 'Toast'})
			my_word.save()
			my_other_word = Word.new({:word_entry => 'Jam'})
			my_other_word.save()
			expect(Word.all().length()).to(eq(2))
		end
	end

	# Should make the list empty
	describe('.clear') do
		it("clears the array of words") do 
			my_word = Word.new({:word_entry => 'Toast'})
			my_word.save()
			Word.clear()
			expect(Word.all()).to(eq([]))
		end
	end

	# All words should be accessible
	describe('.all') do
		it("returns an empty array at first") do
			expect(Word.all()).to(eq([]))
		end

		it("returns and array of words") do
			my_word = Word.new({:word_entry => 'Toast'})
			my_word.save()
			my_other_word = Word.new({:word_entry => 'Jam'})
			my_other_word.save()
			expect(Word.all()).to(eq([my_word, my_other_word]))
		end
	end

	# Should be able to add multiple definitions to the word
	describe('#add_definition') do
		it('returns an empty array at first') do
			my_word = Word.new({:word_entry => 'Toast'})
			expect(my_word.definition_list()).to(eq([]))
		end

		it('stores a definition') do
			my_word = Word.new({:word_entry => 'Toast'})
			my_word_definition = "A grilled slice of bread"
			my_word.add_definition(my_word_definition)
			expect(my_word.definition_list()[0].definition_entry).to(eq(my_word_definition))
		end

		it('stores all definitions') do
			my_word = Word.new({:word_entry => 'Jam'})
			my_word_definition = "A condiment often put on toast"
			my_other_word_definition = "A song that one likes very much"
			my_word.add_definition(my_word_definition)
			my_word.add_definition(my_other_word_definition)
			expect(my_word.definition_list()[0].definition_entry).to(eq(my_word_definition))
			expect(my_word.definition_list()[1].definition_entry).to(eq(my_other_word_definition))
		end
	end

	# Should create identifier for the word in the list
	describe('#id') do
		it('returns the correct id for each word') do 
			my_word = Word.new({:word_entry => 'Toast'})
			my_word.save()
			my_other_word = Word.new({:word_entry => 'Jam'})
			my_other_word.save()
			expect(my_other_word.id()).to(eq(2))
		end
	end

	# Should be able to find the word with the same id 
	describe('.find') do
		it('returns the object with the same id') do
			my_word = Word.new({:word_entry => 'Toast'})
			my_word.save()
			my_other_word = Word.new({:word_entry => 'Jam'})
			my_other_word.save()
			expect(Word.find(2)).to(eq(my_other_word))
		end
	end

end