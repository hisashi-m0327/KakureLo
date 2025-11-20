class Relationsip < ApplicationRecord
  belongs_to :following, class_name: 'User'
  belomgs_to :follower, class_name: 'User'
end
