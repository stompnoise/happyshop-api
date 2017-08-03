class ProductResource < JSONAPI::Resource
  attributes :name, :sold_out, :category, :under_sale, :price, :sale_price, :sale_text

  filter :id
  filters :category, :price, :price_min, :price_max

  class << self
    def apply_filter(records, filter, value, options)
      case filter
        when :price_min
          records.where('price >= ?', value[0].to_f)
        when :price_max
          records.where('price <= ?', value[0].to_f)  
        else
          return super(records, filter, value)
      end
    end
  end

  # filter :price_min, apply: -> (records, value, _options) {
  #   Product.where("price >= ?", value[0].to_f)
  # }
  # filter :price_max, apply: -> (records, value, _options) {
  #   Product.where("price <= ?", value[0].to_f)
  # }

  paginator :paged
end
