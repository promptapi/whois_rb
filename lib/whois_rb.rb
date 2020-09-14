require "whois_rb/version"
require "whois_rb/http"

module WhoisRb
  class Error < StandardError; end

  class << self
    def check(domain, timeout=10)
      WhoisRb::Http.get(domain, timeout)
    end

    def query(domain, timeout=10)
      WhoisRb::Http.get(domain, timeout, 'query')
    end
  end
end
