require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'space'

class Request
  include DataMapper::Resource

  property :id,             Serial
  property :requested_date, Date

  belongs_to :serial
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
