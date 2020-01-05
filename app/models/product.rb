class Product < ApplicationRecord

  WEEKS_TO_MONTHS = 4.3

  def age_units
    if age_high_weeks < 13
      "weeks"
    else
      "months"
    end
  end
  def age_low
    if age_units == "months"
      (age_low_weeks / WEEKS_TO_MONTHS).round
    else
      age_low_weeks
    end
  end

  def age_high
    if age_units == "months"
      (age_high_weeks / WEEKS_TO_MONTHS).round
    else
      age_high_weeks
    end
  end
end
