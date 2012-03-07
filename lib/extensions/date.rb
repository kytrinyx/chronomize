class Date
  class << self
    def today?(date)
      Date.today == date
    end

    def yesterday?(date)
      (Date.today - 1) == date
    end

    def tomorrow?(date)
      (Date.today + 1) == date
    end
  end
end
