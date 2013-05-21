if Rails.env.development? || Rails.env.test?

  module I18n
    def self.just_raise_that_exception(*args)
      raise args.first.to_s
    end
  end

  I18n.exception_handler = :just_raise_that_exception

end
