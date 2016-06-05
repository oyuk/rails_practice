class WorkAddress < Address
  before_validation do
    self.company_name = normarize_as_name(company_name)
    self.division_name = normarize_as_name(division_name)
  end

  validates :company_name, presence: true
  
end
