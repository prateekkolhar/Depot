require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  fixtures :products

  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:price].any?
  	assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
  	product = Product.new( title: "Blah Blah",
  		description: " bleah asdasdkajsd",
  		image_url: "asd.jpg")
  	product.price = -1
  	assert product.invalid?

  	assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

  	product.price =0
  	assert product.invalid?
  	assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

  	product.price=1
  	assert product.valid?
  end

  def new_product(image_url)
  	Product.new(title: "bleh bleh",
  		description: "asdasd",
  		price: 1,
  		image_url: image_url)
  end

  	test "image url correct format" do
	  	ok_image_urls= %w{ fred.jpg fred.gif 
	  		fred.png FRED.JPG FRED.Jpg http://asdasd/a/as/s/d/fred.gif }
		bad_image_urls= %w{ fred.doc fred.gif/more fred.gif.more }

		ok_image_urls.each do |url|
			assert new_product(url).valid?, "#{url} should be valid"
		end

		bad_image_urls.each do |url|
			assert new_product(url).invalid?, "#{url} should be invalid"
		end
	end

	test "product is not valid without a unique title" do
		product = Product.new(title: products(:one).title, 
			description: "asdas",
			price: 1,
			image_url: "asd.jpg")

		assert_equal "MyString", products(:one).title
		assert_equal "MyString1", products(:two).title
		assert product.invalid?
		assert_equal ["has already been taken"], product.errors["title"]
	end

	test "product is not valid without a unique title - i18n" do
		product = Product.new( title: products(:one).title,
			description: "asd",
			price: 1,
			image_url: "asd.jpg")
		assert product.invalid?
		assert_equal [I18n.translate('errors.messages.taken')], 
			product.errors["title"]

		end

end
