class City < ActiveRecord::Base
  belongs_to :region
  has_many :companies
  has_many :agents
  has_many :rieltors
end