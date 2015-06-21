module JaroWinkler
  P = 0.1 # scaling factor
  BT = 0.7 # boost threshold

  module_function
  def comp(str1, str2)
    # TODO: JaroWinkler Algorithm
    jarowinkler_distance str1, str2
  end

  def jarowinkler_distance str1, str2
    l = common_prefix_length str1, str2 
    winkler_distance((jaro_distance(str1, str2)), l)
  end

  # jaro distance
  def jaro_distance str1, str2
    s1 = str1.size
    s2 = str2.size
    s1flags = Array.new(s1,0)
    s2flags = Array.new(s2,0)
    m = 0 # number of matching characters
    t = 0 #
    range = max(0, max(s1, s2) / 2 - 1)

    # Calculate matching characters
    for i in (0...s1) do
      start_i = max(i - range, 0)
      end_i = min(i + range + 1, s2)
      for j in (start_i...end_i) do
        if str1[i].eql?(str2[j]) && s2flags[j] != 1
          s1flags[i] = 1
          s2flags[j] = 1
          m += 1
          break
        end
      end
    end
    return 0.0 if m == 0

    # Calculate transposition
    l = 0
    for i in (0...s1) do
      if s1flags[i] == 1
        for j in (l...s2) do
          if s2flags[j] == 1
            l = j + 1
            break
          end
        end
        t += 1 if str1[i] != str2[j]
      end
    end
    t /= 2
    (m.to_f/s1 + m.to_f/s2 + (m.to_f - t)/m.to_f)/3.0
  end

  # winkler distance
  def winkler_distance dj, l
    #p "jaro distance: #{dj}"
    if dj < BT
      dj
    else
      dj + l * P * (1.0 - dj)
    end
  end

  # the length of common prefix at the start of the string up to a
  # maximum of 4 characters
  def common_prefix_length str1, str2
    l = 0
    s1 = str1.size
    s2 = str2.size
    for i in (0...min(min(s1,s2),4)) do
      if str1[i].eql?(str2[i])
        l += 1
      else
        break
      end
    end
    l
  end

  def max size1, size2
    size1 > size2 ? size1 : size2 
  end

  def min x, y
    x > y ? y : x
  end

end
