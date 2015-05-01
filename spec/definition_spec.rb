require('rspec')
require('definition')

describe(Definition) do 
	describe('#initialize') do
	# Definition will hold an entry 
		it("returns the correct definition") do
			my_entry = "This is a test definition entry"
			my_definition = Definition.new(:entry => my_entry)
			expect(my_definition.entry()).to(eq(my_entry))
		end
	end
end