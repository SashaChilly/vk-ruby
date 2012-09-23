# encoding: UTF-8

class VK::Standalone
  include VK::Core
  include Transformer

  extend ::VK::Configurable

  attr_accessor :expires_in

  # Application settings(scope) that will be used to make authorize request.
  # Default `'notify,friends,offline'`
  # @method settings
  #
  # {http://vk.com/developers.php?oid=-1&p=%D0%9F%D1%80%D0%B0%D0%B2%D0%B0_%D0%B4%D0%BE%D1%81%D1%82%D1%83%D0%BF%D0%B0_%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D0%B9 Read more.}

  attr_configurable :settings, default: 'notify,friends'

  # A new VK::Standalone application.
  def initialize(params={})
    params.each{|k,v| instance_variable_set(:"@#{k}", v) }

    transform base_api, self.method(:vk_call)
    transform ext_api,  self.method(:vk_call)
  end
end