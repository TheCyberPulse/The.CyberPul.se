require 'sinatra'
require 'yaml'

link_dictionary = YAML.load_file('link_dictionary.yml')

get '/:shortcode' do
  new_link = link_dictionary[params['shortcode']].to_s
  redirect new_link if new_link.length > 0
  redirect 'https://the.cyberpul.se' unless new_link.length > 0
end
