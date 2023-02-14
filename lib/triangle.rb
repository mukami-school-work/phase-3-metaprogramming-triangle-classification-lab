class Triangle
  attr_reader :length1, :length2, :length3
  def initialize(length1, length2, length3)
    @length1 = length1
    @length2 = length2
    @length3 = length3
  end
  def kind
    validate_triangle
    if length1 == length2 && length2 == length3
      :equilateral
    elsif length1 == length2 || length2 == length3 || length1 == length3
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    valid_triangle = [(length1 + length2 > length3), (length1 + length3 > length2), (length2 + length3 > length1)]
    [length1, length2, length3].each { |s| valid_triangle << false if s <= 0 }
    [length1, length2, length3].each do |side|
      valid_triangle << false if side <= 0 
    raise TriangleError if valid_triangle.include?(false)
    end
  end

  class TriangleError < StandardError
  end
end