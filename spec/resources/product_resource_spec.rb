
require 'rails_helper'

RSpec.describe ProductResource, type: :resource do
  let(:product) { Product.new(id: 1, name: 'test', price: 100) }
  subject { described_class.new(product, {}) }

  it { is_expected.to have_attribute :name }
  it { is_expected.to have_attribute :price }
  it { is_expected.to filter(:category) }
  it { is_expected.to filter(:price) }
  it { is_expected.to filter(:price_min) }
  it { is_expected.to filter(:price_max) }
end
