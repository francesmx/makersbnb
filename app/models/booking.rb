class Booking
  include DataMapper::Resource

  property :id, Serial
  property :check_in, Date
  property :check_out,   Date
  property :status,      String


  belongs_to :space
  belongs_to :user
end
