class Task < ActiveRecord::Base
  belongs_to :list
  attr_accessible :complete,
                  :name,
                  :list,
                  :due_date

  validates :name, presence: true

  def self.sort_by_due_date
    order(:due_date)
  end
end
