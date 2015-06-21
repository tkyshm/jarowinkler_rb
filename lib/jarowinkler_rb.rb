require "jarowinkler_rb/version"
require "jarowinkler_rb/jarowinkler"

module JarowinklerRb
  # Your code goes here...
  module_function
  def comp(str1, str2)
    JaroWinkler::comp(str1,str2)
  end

end
