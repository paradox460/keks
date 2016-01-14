require 'sinatra/base'
require 'json'

class Keks < Sinatra::Base
  get %r{/stream} do
    content_type :txt
    stream do |out|
      loop { out << "kek\n" }
    end
  end

  get %r{/(\d+)(\.json)?} do |amount, json|
    content_type(json.nil? ? :txt : :json)
    keks(amount.to_i, json)
  end

  get %r{/(\.json)?} do |json|
    content_type(json.nil? ? :txt : :json)
    keks(rand(100), json)
  end

  get '/*' do
    keks(rand(100))
  end

  run! if app_file == $PROGRAM_NAME

  private

  def keks(amount = 1, json = nil)
    k = ['kek'] * amount
    return k.to_json if json
    k.join(' ')
  end
end
