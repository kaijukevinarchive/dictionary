require('rspec')
require('word')
require('definition')

# Words should be able to hold multiple definitions
describe(Word) do

	before do
		Word.clear()
	end

	describe('#initialize') do
		it("returns the word") do
			my_word = Word.new(:word_entry => 'Toast')
			expect(my_word.word_entry()).to(eq('Toast'))
		end
	end

	describe('#save') do
		it("saves the word into an array") do 
			my_word = Word.new(:word_entry => 'Toast')
			my_word.save()
			expect(Word.all()).to(eq([my_word]))
		end
	end

	describe('.clear') do
		it("clears the array of words") do 
			my_word = Word.new(:word_entry => 'Toast')
			my_word.save()
			Word.clear()
			expect(Word.all()).to(eq([]))
		end
	end

	describe('.all') do
		it("should return an empty array at first") do
			expect(Word.all()).to(eq([]))
		end

		it("should return and array of words") do
			my_word = Word.new(:word_entry => 'Toast')
			my_other_word = Word.new(:word_entry => 'Toast')
			my_word.save()
			my_other_word.save()
			expect(Word.all()).to(eq([my_word, my_other_word]))
		end
	end

end