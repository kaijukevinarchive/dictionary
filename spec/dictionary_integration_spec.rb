require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the dictionary path", {:type => :feature}) do
	before do
		Word.clear()
	end
	it("visits the index page") do
		visit('/')
		expect(page).to have_content("Your Words:")
	end

	it("visits the new word form") do
		visit('/')
		click_link('Add Word')
		expect(page).to have_content("New Word")
	end

	it("adds a new word to the list") do
		visit('/')
		click_link('Add Word')
		fill_in('word', :with => "Jam")
		click_button('Add Word')
		expect(page).to have_content("Jam")
	end

	it("visits the individual word page") do
		test_word = "Jam"
		visit('/')
		click_link('Add Word')
		fill_in('word', :with => test_word)
		click_button('Add Word')
		click_link(test_word)
		expect(page).to have_content('Definitions:')
		expect(page).to have_content(test_word)
	end

	it("visits the definition page") do
		test_word = "Jam"
		visit('/')
		click_link('Add Word')
		fill_in('word', :with => test_word)
		click_button('Add Word')
		click_link(test_word)
		click_link('Add Definition')
		expect(page).to have_content("New Definition")
	end

	it("adds a definition through the new word page") do
		test_word = "Jam"
		test_definition = "Kind of like jelly"
		visit('/')
		click_link('Add Word')
		fill_in('word', :with => test_word)
		fill_in('definition', :with => test_definition)
		click_button('Add Word')
		click_link(test_word)
		expect(page).to have_content(test_definition)
	end

	it("adds an extra definition to a word") do
		test_word = "Jam"
		test_definition = "Kind of like jelly"
		visit('/')
		click_link('Add Word')
		fill_in('word', :with => test_word)
		click_button('Add Word')
		click_link(test_word)
		click_link('Add Definition')
		fill_in('definition', :with => test_definition)
		click_button('Add Definition')
		expect(page).to have_content(test_definition)
	end

	it("visits the clear path and clears Word data") do
		test_word = "Jam"
		test_definition = "Kind of like jelly"
		visit('/')
		click_link('Add Word')
		fill_in('word', :with => test_word)
		fill_in('definition', :with => test_definition)
		click_button('Add Word')
		visit('/clear')
		expect(Word.all()).to eq([])
	end
end