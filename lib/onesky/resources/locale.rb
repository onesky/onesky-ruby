require 'rest-client'

module Resources
  module Locale

    def list_locale
      path = '/locales'

      get(path)
    end

  end
end
