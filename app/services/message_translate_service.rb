class MessageTranslateService
  require 'nokogiri'

  def self.translate(message, dialect)
    api_url = "http://www.degraeve.com/cgi-bin/babel.cgi?"

    body = {
      "d" => dialect,
      "w" => message
    }

    response = HTTParty.get(api_url + body.to_query)
    translated_message = Nokogiri::HTML::DocumentFragment.parse(response.body).at('blockquote').try(:text)
    if response.code == 200 && translated_message.present?
      translated_message
    else
      message
    end
  end
end
