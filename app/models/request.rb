class Request
  include DataMapper::Resource

  property :id, Serial
  property :check_in, Date
  property :check_out,   Date


  belongs_to :space
  belongs_to :user
end
