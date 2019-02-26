class Ability < ApplicationRecord
  has_many :ability1, class_name: 'Character', :foreign_key => 'ability1_id'
  has_many :ability2, class_name: 'Character', :foreign_key => 'ability2_id'
  has_many :ability3, class_name: 'Character', :foreign_key => 'ability3_id'
end
