require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validation' do
    category = Category.create!(name: "Books")

    it "is valid with valid attributes" do
      product = category.products.new ({
        name: "Maliha's cards",
        price: 56,
        quantity: 10
      })
      # expect(product).to be_valid
      expect(product.errors.full_messages).to eq([])
    end

    it "is not valid without a name" do
      product = category.products.create({
        name: nil,
        price: 56,
        quantity: 2
      })
      # expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      product = category.products.create({
        name: "Maliha's cards",
        price: nil,
        quantity: 2
      })
      # expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a quantity" do
      product = category.products.create({
        name: "Maliha's cards",
        price: 56,
        quantity: nil
      })
      # expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a category" do
      product = Product.create({
        name: "Maliha's cards",
        price: 56,
        quantity: 10
      })
      # expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
