module ApplicationHelper
    def flash_class(level)
      case level.to_sym # Convert the string to a symbol for comparison
      when :notice then "bg-blue-100 border-blue-500 text-blue-700"
      when :success then "bg-green-100 border-green-500 text-green-700"
      when :error then "bg-red-100 border-red-500 text-red-700"
      when :alert then "bg-yellow-100 border-yellow-500 text-yellow-700"
      else level.to_s # Return the level as a string if no match
      end
    end
  end
  