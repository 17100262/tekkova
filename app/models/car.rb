class Car < ApplicationRecord
    has_and_belongs_to_many :car_features
    has_many_attached :images
    serialize :availibility_days,Array
    belongs_to :user



end
