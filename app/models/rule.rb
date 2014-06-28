class Rule < ActiveRecord::Base
  serialize :values

  belongs_to :flexlist
end
