require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('./lib/definition')
also_reload('lib/**/*.rb')

get('/') do
	@words_list = Word.all()
	erb(:index)
end

get('/word/new') do
	erb(:new_word_form)	
end

post('/') do
	new_word = Word.new({:word_entry => params.fetch('word')})
	new_definition = params.fetch('definition')
	new_word.add_definition(new_definition)
	new_word.save()
	@words_list = Word.all()
	erb(:index)
end

get('/word/:id') do
	@word = Word.find(params.fetch('id').to_i)
	erb(:word)
end

get('/word/:id/definition/new') do
	@word = Word.find(params.fetch('id').to_i)
	erb(:new_definition_form)
end

post('/word/:id/definition') do
	@word = Word.find(params.fetch('id').to_i)
	new_definition = params.fetch('definition')
	@word.add_definition(new_definition)
	erb(:word)
end

get('/clear') do
	Word.clear()
	@words_list = Word.all()
	erb(:index)
end