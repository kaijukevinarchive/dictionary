require('rspec')
require('word')
require('definition')

# Words should be able to hold multiple definitions
describe(Word) do
	describe('#initialize') do
		it('returns the word') do
			my_word = Word.new(:word_entry => 'Toast')
			expect(my_word.word_entry()).to(eq('Toast'))
		end
	end
end