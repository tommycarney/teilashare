# Shareasale

This is an *unofficial* client library for the ShareaSale affiliate reporting API. It does not include the publisher API or any other APIs at the moment. Please see below for the supported endpoints as well as a required and optional parameters on each endpoint.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shareasale'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install shareasale

## Usage

Instantiate a client via:

```
credentials = {
  token: ENV['TOKEN'],
  api_secret: ENV['API_SECRET'],
  affiliate_id: ENV['affiliate_id']
}
client = Shareasale.new(credentials)

```

You can then request reports on this client via:

```
result = client.today_stats(format: 'xml')
```
Please refer to the Shareasale documentation for required and optional parameters
for your desired report. The default format is CSV, but you can request XML format or pipe formatted data (PSV?) via the format option.

### Activity Details

required params:
- action
- version
- affiliateId
- token
- dateStart

optional
- dateEnd
- merchantId
- lockDate,
- paidDate
- sortCol
- sortDir
- XMLFormat
- xml_format

```
Shareasale.activity_details(
    start_date: '07-31-2020',
    end_date: '08-31-2020',
    merchant_id: 234234234,

  )

```

### Activity Summary
required params:
- action
- version
- affiliateId
- token

optional params
-	merchantId	Merchant Id Value
- filterCol	hits, sales, OR commissions
-	filterSpan	month OR total
-	filterValue	Number
-	sortCol	hitsmonth, salesmonth, salestotal, commissionsmonth, commissionstotal, organization
- sortDir	asc or desc
-	XMLFormat	0 or 1
- format	pipe, xml, csv

```
client.activity_summary(sort_col: 'salestotal', sort_dir: 'asc')

```

### Merchant Timespan Report
required params:
- dateStart

optional params
-	dateEnd	mm/dd/yyyy
-	merchantId	Merchant Id Value
-	sortCol	hits, grosssales, reversals, netsales, sales, mcredits, commissions
-	sortDir	asc or desc
-	XMLFormat	0 or 1
- format	pipe, xml, csv

```
csv = client.merchant_timespan(date_start: '12/31/2020')

```

### Today's Stats
required params
- none

optional params
- 	distinctlink	1 or 0
- sortCol	commissions, hits, sales
-	sortDir	asc or desc
- XMLFormat	0 or 1
- format	pipe, xml, csv


```
client.today_stats(
  distinct_link: 1,
  sort_col: 'commissions',
  sort_dir: 'asc'
  )
```

### Monthly Summary
required params
-	dateMonth	mm/dd/yyyy

optional params
-	sortCol	merchantId, commissionsum, salesum
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv


```
client.monthly_summary(
  date_month: '12/01/2020',
  sort_col: 'commissions',
  sort_dir: 'asc'
  )
```


### Void Trail
required params
-	dateStart	mm/dd/yyyy

optional params
-	dateEnd	mm/dd/yyyy
-	merchantID	Valid merchant ID.
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.void_trail(
  date_start: '12/01/2020',
  )
```

### Traffic
required params
- dateStart

optional params
-	dateEnd	mm/dd/yyyy
-	groupBy	bannerID or afftrack
-	bannerID	Valid bannerID value. MerchantID must also be specified when using this parameter. BannerType must also be specified when using this parameter.
-	afftrack	Valid afftrack value. MerchantID must also be specified when using this parameter.
-	sortCol	hits, commissions, numberOfSales, numberOfVoids, conversion, epc
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

conditionally required
-	bannerType	Click for values.
-	merchantId	Valid Merchant Id

```
client.traffic(
  date_start: '12/01/2020',
  )
```

### API Token Count
required params
- n/a

optional params
- XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.api_token_count

```


### Products
required params
-	keyword	Word or Phrase

optional params
-	merchantId	Valid Merchant Id
-	excludeMerchants	List of Merchant Id
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.products(
  keyword: 'wool hats'
  )

```

### Invalid Links
required params
- n/a

optional params
-	merchantIdList	Comma delimited list of valid Merchant IDs
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.invalid_links(
  merchantIdList: 12342,1234234,234234
  )

```

### Order Inquiry
required params
-	merchantId	Valid Merchant Id
-	orderDate	mm/dd/yyyy
-	orderNumber	Merchant's order number (alpha-numeric)

optional params
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.order_inquiry(
  merchant_id: 1234,
  order_date: '12/31/2020',
  order_number: abcdef234
  )

```
### Merchant Datafeeds
required params
- n/a

optional params
-	blnMemberOf	1 or 0
-	blnNotMemberOf	1 or 0
-	category	Click for values.
-	updateDate	mm/dd/yyyy
-	keyword	word or phrase
-	sortCol	7DayEpc, 30DayEpc, saleCommissionAmount, productcount, datafeedupdated, organization
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.merchant_datafeed

```

### Coupon Deals
required params
- n/a

optional params
-	current	1
-	modifiedSince	mm/dd/yyyy
-	merchantId	Valid Merchant Id number.
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.coupon_deal

```

### Merchant Status
required params
- n/a

optional params
-	merchantId	List of Merchant Id
-	category	Click for values.
-	programStatus	online, offline, lowfunds, onlineNotLowFunds
-	keyword	word or phrase
-	sortCol	organization, salescommission, hitcommission, leadcommission, merchantStatus, category, applydate
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv
```
client.merchant_status

```

### Merchant Creatives
required params
- n/a

optional params
-	sortCol	bannerId, bannerHeight, bannerWidth, category, type
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

conditional params
-	merchantId	Valid Merchant Id. Required unless modifiedDate is present.
-	modifiedDate	Valid date no more than 31 days in the past. Required unless merchantID is present. Format MM/DD/YYYY


```
client.merchant_creative

```


### Merchant Gift Cards
required params
- n/a

optional params
-	sortCol	giftcardId, publishdate, title, merchantId, organization
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.merchant_gift_cards

```

### Edit Trail
required params
-	dateStart	mm/dd/yyyy

optional params
-	dateEnd	mm/dd/yyyy
-	merchantID	Valid merchant ID.
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.edit_trail

```


### Payment Summary
required params
-	paymentDate	mm/dd/yyyy must be 20th of month in the last 12 months

optional params

-	sortCol	organization, merchantID, commissions, numberofsales
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.payment_summary

```
### Merchant Search
required params
- n/a

optional params
-	Keyword	Word or Phrase
-	Category	Click for values.
-	activatedSince	mm/dd/yyyy
-	-tjoined	1 or 0
-	datafeed	1 or 0
-	autodeposit	1 or 0
-	autoapprove	1 or 0
-	epc	Any number
-	avgsale	Any number
-	reversalrate	Any number
-	cookielength	Any Number
-	sortCol	a7dayepc,a30dayepc,salecommission,leadcommission,hitcommission,organization,organization,startdate,cookielength,powerrank,relationshipID
-	sortDir	asc or desc
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.merchant_search(keyword: 'wool')

```
### Merchant Search by Product
required params
-	keyword	Word or Phrase

optional params
-	-tjoined	1 or 0
-	merchantId	Valid Merchant Id
-	excludeMerchants	List of Merchant Id
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.merchant_search_by_product(keyword: 'shoes')

```
### Ledger Report
required params
- n/a

optional params
-	dateStart	mm/dd/yyyy
-	dateEnd	mm/dd/yyyy
-	includeOrderDetails	0 or 1
-	includeMerchantDetails	0 or 1
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.ledger_report

```

### Balance Inquiry
required params
- n/a

optional params
-	XMLFormat	0 or 1
-	format	pipe, xml, csv

```
client.balance_inquiry

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

If you want to record API requests, you'll need to export environment variables in the format:

```
export TOKEN=abc
export AFFILIATE_ID=123456789
export API_SECRET=def
export API_VERSION=2.3

```

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tommycarney/shareasale.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
