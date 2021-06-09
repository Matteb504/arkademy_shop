require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context 'when data provided is valid' do
    # it 'creates a Product instance in the database' do
    # end
    let(:params) {{name:'Sneakers',price: 49.99, quantity: 4}}
    it 'saves the instace' do
      expect(described_class.new(params).save!).to eq true
    end
    
    it { expect { described_class.new(params).save! }.to change { Product.all.size }.by(1) }
  end

  context 'when data provided is invalid' do
    # it 'creates a Product instance in the database' do
    # end
    context 'when name is missing' do
      let(:params) {{name:'', price: 49.99, quantity: 4}}
      
      it 'returns missing error message' do
        expect{described_class.create!(params)}.to raise_error("Validation failed: Name can't be blank")
      end
    end
    context 'when price is missing' do
      let(:params) {{name:"Product", price: nil, quantity: 4}}
      it 'no price' do
        expect{described_class.create!(params)}.to raise_error("Validation failed: Price can't be blank")
      end
    end
    context 'when quantity is missing' do
      let(:params) {{name:"Product", price: 49.99, quantity: nil}}
      it 'no quantity' do
        expect{described_class.create!(params)}.to raise_error("Validation failed: Quantity can't be blank")
      end
    end
  end
end