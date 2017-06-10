class Assignment < ActiveRecord::Base
    belongs_to :employee, inverse_of: :assignments
    belongs_to :role, inverse_of: :assignments
    accepts_nested_attributes_for :employee
    accepts_nested_attributes_for :role
    validates :employee_id, presence: true
    validates :role_id, presence: true
end
