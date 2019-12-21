class Tool < ActiveRecord::Base
    belongs_to :chore
    has_many :users, through: :chore
end