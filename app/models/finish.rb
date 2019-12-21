class Finish < ActiveRecord::Base
    belongs_to :chores
    belongs_to :tools
end