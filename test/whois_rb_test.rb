require "test_helper"

class WhoisRbTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::WhoisRb::VERSION
  end

  def test_promptapi_token
    skip "PROMPTAPI_TOKEN is exists, skipping test..." if ENV['PROMPTAPI_TOKEN']

    result = WhoisRb::check('foo')
    refute_nil result.fetch(:error)
    assert_equal result.fetch(:error), "You need to set PROMPTAPI_TOKEN environment variable"
  end

  def test_check_method_with_fake_domain
    skip "PROMPTAPI_TOKEN required, skipping test..." unless ENV['PROMPTAPI_TOKEN']
    
    result = WhoisRb::check('foo')
    refute_nil result.fetch(:error)
    assert_equal result.fetch(:error), "Not a valid domain name"
  end

  def test_check_method_with_existing_domain
    skip "PROMPTAPI_TOKEN required, skipping test..." unless ENV['PROMPTAPI_TOKEN']
    
    result = WhoisRb::check('promptapi.com')
    refute_nil result.fetch(:result)
    assert_equal result.fetch(:result), "registered"
  end

  def test_check_method_with_probably_non_existing_domain
    skip "PROMPTAPI_TOKEN required, skipping test..." unless ENV['PROMPTAPI_TOKEN']
    
    result = WhoisRb::check('promptapi123456.com')
    refute_nil result.fetch(:result)
    assert_equal result.fetch(:result), "available"
  end

  def test_query_method_with_fake_domain
    skip "PROMPTAPI_TOKEN required, skipping test..." unless ENV['PROMPTAPI_TOKEN']
    
    result = WhoisRb::query('foo')
    refute_nil result.fetch(:error)
    assert_equal result.fetch(:error), "Not a valid domain name"
  end

  def test_query_method_with_existing_domain
    skip "PROMPTAPI_TOKEN required, skipping test..." unless ENV['PROMPTAPI_TOKEN']
    
    result = WhoisRb::query('promptapi.com')
    refute_nil result.fetch(:result)
    refute_nil result.fetch(:result).fetch(:domain_name)
    assert_equal result.fetch(:result).fetch(:domain_name), "PROMPTAPI.COM"
  end

  def test_query_method_with_probably_non_existing_domain
    skip "PROMPTAPI_TOKEN required, skipping test..." unless ENV['PROMPTAPI_TOKEN']
    
    result = WhoisRb::query('promptapi123456.com')
    refute_nil result.fetch(:error)
    assert_equal result.fetch(:error), "No match for promptapi123456.com"
  end

end
