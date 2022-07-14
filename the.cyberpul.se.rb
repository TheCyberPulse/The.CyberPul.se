require 'sinatra'
require 'yaml'

FINAL_DEFAULT_URL = 'https://the.cyberpul.se'

configure {
  set :server, :puma
}

class TheCyberPulse < Sinatra::Base
  get '/:shortcode' do
    redirect resolve_link(params['shortcode'].to_s.downcase)
  end

  get '/:shorcode/*' do
    redirect resolve_link(params['shortcode'].to_s.downcase)
  end

  get '/' do
    send_file 'home.html'
  end

  def resolve_link(code)
    link_dictionary = YAML.load_file('config/link_dictionary.yml')
    default_link = link_dictionary['DEFAULT'].to_s
    new_link = link_dictionary[code].to_s
    return new_link if new_link.length > 0
    return default_link if default_link.length > 0
    return FINAL_DEFAULT_URL
  end

  run! if app_file == $0
end
