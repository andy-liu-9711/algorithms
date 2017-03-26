class BinarySearchTree
  attr_reader :val
  attr_accessor :left, :right

  def initialize(val)
    @val = val
  end

  def add(val)
    if self.val > val
      add_left(val)
    else
      add_right(val)
    end
  end

  def path_from_root(val)
    return path_from_left(val) if self.val > val

    return path_from_right(val) if self.val < val

    [self.val] if self.val == val
  end

  def distance(val1, val2)
    path1 = path_from_root(val1)
    path2 = path_from_root(val2)

    return -1 if path1.nil? || path2.nil?

    shared_path = path1 & path2

    sub_path1 = path1.slice(shared_path.length, path1.length - shared_path.length)
    sub_path2 = path2.slice(shared_path.length, path2.length - shared_path.length)

    sub_path1.length + sub_path2.length
  end

  def self.from_array(arr)
    raise "The array argument is empty" if arr.nil? || arr.empty?

    tree = BinarySearchTree.new(arr.first)
    (1..arr.length - 1).each do |index|
      tree.add(arr[index])
    end

    tree
  end


  private
  def add_left(val)
    if self.left
      self.left.add(val)
    else
      self.left = BinarySearchTree.new(val)
    end
  end

  def add_right(val)
    if self.right
      self.right.add(val)
    else
      self.right = BinarySearchTree.new(val)
    end
  end

  def path_from_left(val)
    return nil if self.left.nil?

    left_path = self.left.path_from_root(val)
    left_path.nil? ? nil : left_path.unshift(self.val)
  end

  def path_from_right(val)

    return nil if self.right.nil?

    right_path = self.right.path_from_root(val)
    right_path.nil? ? nil : right_path.unshift(self.val)
  end
end

# test cases
def test_case_1
  tree = BinarySearchTree.from_array([5, 3, 2, 4, 8, 7, 10])

  p "path from root to 4 is: #{tree.path_from_root(4)}"
  p "path from root to 7 is: #{tree.path_from_root(7)}"
  p "the distance from 4 to 7 is: #{tree.distance(4, 7)}"

  result = tree.distance(4, 7) == 4 ? "succeeded" : "failed"
  p "test case 1: #{result}"
end


def test_case_2
  tree = BinarySearchTree.from_array([5, 3, 2, 4, 8, 7, 10])

  p "path from root to 4 is: #{tree.path_from_root(4)}"
  p "path from root to 11 is: #{tree.path_from_root(11)}"
  p "the distance from 4 to 11 is: #{tree.distance(4, 11)}"

  result = tree.distance(4, 11) == -1 ? "succeeded" : "failed"
  p "test case 2: #{result}"
end

def test_case_3
  tree = BinarySearchTree.from_array([5, 2, 2, 3, 8, 8, 7, 10])

  p "path from root to 3 is: #{tree.path_from_root(3)}"
  p "path from root to 7 is: #{tree.path_from_root(7)}"
  p "the distance from 3 to 7 is: #{tree.distance(3, 7)}"

  result = tree.distance(3, 7) == 5 ? "succeeded" : "failed"
  p "test case 3: #{result}"
end

def test_case_4
  tree = BinarySearchTree.from_array([5, 2, 2, 3, 8, 8, 7, 10])

  p "path from root to 7 is: #{tree.path_from_root(7)}"
  p "path from root to 10 is: #{tree.path_from_root(10)}"
  p "the distance from 10 to 7 is: #{tree.distance(10, 7)}"

  result = tree.distance(10, 7) == 3 ? "succeeded" : "failed"
  p "test case 4: #{result}"
end

def test_case_5
  tree = BinarySearchTree.from_array([5])

  p "path from root to 5 is: #{tree.path_from_root(5)}"
  p "the distance from 5 to 5 is: #{tree.distance(5, 5)}"

  result = tree.distance(5, 5) == 0 ? "succeeded" : "failed"
  p "test case 5: #{result}"
end

# run test cases
test_case_1
test_case_2
test_case_3
test_case_4
test_case_5
