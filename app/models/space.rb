require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'request.rb'

class Space
  include DataMapper::Resource

  has n, :requests

  property :id,             Serial
  property :name,           String
  property :description,    Text
  property :price,          Integer
  property :available_from, Date
  property :available_to,   Date

  def self.search_availability(available_from, available_to)
    all(:available_from.lte => available_from,
        :available_to.gte => available_to)
  end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
