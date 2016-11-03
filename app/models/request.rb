class Request
  include DataMapper::Resource

  property :requested_date, Date


  belongs_to :space
  belongs_to :user
end
