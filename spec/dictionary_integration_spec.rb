require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the dictionary path", {:type => :feature}) do
	it("visits the index page") do
		visit('/')
		expect(page).to have_content("Welcome")
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
end