require 'faraday'
require 'json'

module WhoisRb
  module Http
    PROMPTAPI_ENDPOINT = 'https://api.promptapi.com/whois'

    class << self
      def parse(body)
        begin
          JSON.parse(body, symbolize_names: true)
        rescue JSON::ParserError
          {error: "JSON decoding error"}
        end
      end
      
      def get(domain, timeout, url_suffix='check')
        options = {
          url: "#{PROMPTAPI_ENDPOINT}/#{url_suffix}",
          params: {domain: domain},
          request: {timeout: timeout},
          headers: {
            'Accept' => 'application/json',
            'apikey' => ENV['PROMPTAPI_TOKEN'] || nil,
          },
        }
        unless options[:headers]['apikey']
          return {error: "You need to set PROMPTAPI_TOKEN environment variable"}
        end
        
        conn = Faraday.new(options) do |c|
          c.use Faraday::Response::RaiseError
        end
        
        begin
          response = conn.get
          return self.parse(response.body)
        rescue Faraday::ConnectionFailed
          return {error: "Connection error"}
        rescue Faraday::TimeoutError => e
          return {error: e.message.capitalize}
        rescue Faraday::ClientError => e
          return {error: parse(e.response[:body])[:message].capitalize}
        rescue Faraday::ServerError => e
          return {error: e.message.capitalize}
        end
      end
    end
  end
end
