class DoctorSearchQuery
  def initialize(spec_name)
    @spec_name = spec_name
  end

  def call
    Doctor.joins(:spec).where(specs: { name_spec: @spec_name })
  end
end
