class ProgramDataRecord < ApplicationRecord
  self.abstract_class = true
  connects_to database: { writing: :program_data, reading: :program_data }

  def readonly?
    true
  end
end
