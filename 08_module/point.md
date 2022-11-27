# モジュールの章　まとめ

## モジュールの用途はひとつとは限らない

- モジュールを利用したメソッド定義（includeとextend）
  - include インスタンスメソッド
  - extend 特異メソッド

- モジュールを利用した名前空間の作成

```ruby
module Api
  module V1
    class User
    end
  end
end
```

- 関数や定数を提供するモジュールの作成

```ruby
module Loggable
  PREFIX = '[LOG]'

  class << self
    def log(text)
      puts "#{PREFIX} #{text}"
    end
  end
end

Loggable::PREFIX
#=> [LOG]

Loggable.log('Hello.')
#=> [LOG] Hello.
```

`module_function`で定義するとprivateメソッドとなる

- 状態を保持するモジュールの作成

外部ライブラリなどで、設定情報などを保持する。

```ruby
module AwesomeApi
  @base_url = ''
  @debug_model = false

  class << self
    attr_accessor :base_url, :debug_mode
  end
end
```

