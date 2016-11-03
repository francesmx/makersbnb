class Request
  include DataMapper::Resource

  property :id,             Serial
  property :requested_date, Date


  belongs_to :space
end
