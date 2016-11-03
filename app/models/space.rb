class Space
  include DataMapper::Resource

  property :id,             Serial
  property :name,           String
  property :description,    Text
  property :price,          Integer
  property :available_from, Date
  property :available_to,   Date

  has n, :bookings
  belongs_to :user

  def self.search_availability(available_from, available_to)
    all(:available_from.lte => available_from,
        :available_to.gte => available_to)
  end

end
