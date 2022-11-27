module Loggable
end


class Product
  include Loggable
end


# moduleがincludeされているか確認する

p Product.include?(Loggable)
#=> true


# includeされている全てのmoduleを確認する

p Product.included_modules
#=> [Loggable, Kernel]


# includeされているmoduleやsuperclassの情報など全てを返す

p Product.ancestors
#=> [Product, Loggable, Object, Kernel, BasicObject]








