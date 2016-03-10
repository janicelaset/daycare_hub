class DaycareCertification < ActiveRecord::Base
  belongs_to :daycare
  belongs_to :certification
end
