require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    category = Category.new(name: "Books")

    it "is valid with valid attributes" do
      product = category.products.new ({
        name: "Maliha's cards",
        price: 56,
        quantity: 10
      })
      expect(product).to be_valid
    end

    it "is not valid without a name" do
      product = category.products.new({
        name: nil,
        price: 56,
        quantity: 2
      })
      expect(product).to_not be_valid
    end

    it "is not valid without a price" do
      product = category.products.new({
        name: "Maliha's cards",
        price: nil,
        quantity: 2
      })
      expect(product).to_not be_valid
    end

    it "is not valid without a quantity" do
      product = category.products.new({
        name: "Maliha's cards",
        price: 56,
        quantity: nil
      })
      expect(product).to_not be_valid
    end

    it "is not valid without a category" do
      product = Product.new({
        name: "Maliha's cards",
        price: 56,
        quantity: 10
      })
      expect(product).to_not be_valid
    end

  end
end
