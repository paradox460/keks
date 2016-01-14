require 'sinatra/base'

class Keks < Sinatra::Base
  get %r(/(\d+)(\.json)?) do |amount, json|
    keks(amount, json)
  end

  get %r(/(\.json)?) do |json|
    keks(rand(100), json)
  end

  get '/*' do
    keks(rand(100))
  end

  run! if app_file == $0

  private
  def keks(amount = 1, json=nil)
    k = ['kek'] * amount
    return k.to_json if json
    k.join(' ')
  end
end
