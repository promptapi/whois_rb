![Ruby](https://img.shields.io/badge/ruby-2.7.0-green.svg)
[![Gem Version](https://badge.fury.io/rb/whois_rb.svg)](https://badge.fury.io/rb/whois_rb)
[![Build Status](https://travis-ci.org/promptapi/whois_rb.svg?branch=main)](https://travis-ci.org/promptapi/whois_rb)

# Prompt API - Whois API - Ruby Package

`whois_rb` is a simple ruby wrapper for [whois-api][whois-api].

## Requirements

1. You need to signup for [Prompt API][promptapi-signup]
1. You need to subscribe [whois-api][whois-api], test drive is **free!!!**
1. You need to set `PROMPTAPI_TOKEN` environment variable after subscription.

then;

```bash
$ gem install whois_rb
```

or; install from GitHub:

```bash
$ gem install whois_rb --version "0.0.0" --source "https://rubygems.pkg.github.com/promptapi"
```

---

## Example Usage

Check domain examples:

```ruby
require 'whois_rb'

result = WhoisRb::check('promptapi.com')
# => {:result=>"registered"}

result = WhoisRb::check('promptapi.com', timeout=20)
# => {:result=>"registered"}

result = WhoisRb::check('foo')
# => {:error=>"Not a valid domain name"}

result = WhoisRb::check('promptapi123456.com')
# => {:result=>"available"}
```

Query domain examples:

```ruby
require 'whois_rb'

result = WhoisRb::query('foo')
# => {:error=>"Not a valid domain name"}

result = WhoisRb::query('promptapi.com')
# => {
    :result=>{
        :domain_name=>"PROMPTAPI.COM", 
        :registrar=>"NameCheap, Inc.", 
        :whois_server=>"whois.namecheap.com", 
        :referral_url=>nil, 
        :updated_date=>"2020-05-27 22:19:36", 
        :creation_date=>"2020-04-19 15:11:52", 
        :expiration_date=>"2021-04-19 15:11:52", 
        :name_servers=>["APOLLO.NS.CLOUDFLARE.COM", "MARJORY.NS.CLOUDFLARE.COM"], 
        :status=>"clientTransferProhibited https://icann.org/epp#clientTransferProhibited", 
        :emails=>"abuse@namecheap.com", 
        :dnssec=>"unsigned", 
        :name=>nil, 
        :org=>nil, 
        :address=>nil, 
        :city=>nil, 
        :state=>nil, 
        :zipcode=>nil, 
        :country=>nil
    }
}

result = WhoisRb::query('promptapi1234.com')
# => {:error=>"No match for promptapi1234.com"}
```

---

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then,
run `rake test` to run the tests. You can also run `bin/console` for an
interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.
To release a new version, update the version number in `version.rb`, and then
run `bundle exec rake release`, which will create a git tag for the version,
push git commits and tags, and push the `.gem` file to
[rubygems.org][rubygems]

```bash
$ rake -T

rake build            # Build whois_rb-0.0.0.gem into the pkg directory
rake bump[revision]   # Bump version
rake clean            # Remove any temporary products
rake clobber          # Remove any generated files
rake install          # Build and install whois_rb-0.0.0.gem into system gems
rake install:local    # Build and install whois_rb-0.0.0.gem into system gems without network access
rake push_to_github   # Push whois_rb-0.0.0.gem to GitHub registry
rake release[remote]  # Create tag v0.0.0 and build and push whois_rb-0.0.0.gem to rubygems.org
rake test             # Run tests
```

---

## License

This project is licensed under MIT

---

## Contributer(s)

* [Prompt API](https://github.com/promptapi) - Creator, maintainer

---

## Contribute

Bug reports and pull requests are welcome on GitHub:

1. `fork` (https://github.com/promptapi/whois_rb/fork)
1. Create your `branch` (`git checkout -b my-feature`)
1. `commit` yours (`git commit -am 'Add awesome features...'`)
1. `push` your `branch` (`git push origin my-feature`)
1. Than create a new **Pull Request**!

This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [code of conduct][coc].

---

[whois-api]:        https://promptapi.com/marketplace/description/whois-api
[promptapi-signup]: https://promptapi.com/#signup-form
[coc]:              https://github.com/promptapi/whois_rb/blob/main/CODE_OF_CONDUCT.md
[rubygems]:         https://rubygems.org