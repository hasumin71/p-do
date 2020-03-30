# SURU。
* グループチャットのようなtodoアプリを作成しました.
* グループに所属したユーザーが、コメント投稿(todo)&削除することができ、グループに所属するメンバーのコメント一覧を見ることができます。
* 制作期間：約2週間

# 開発の動機
* twitterのような感覚で、友達に対して、todoを気楽に書けるフィールドを作りたいと思い、開発に至りました。

# アプリ名(SURU。)の由来
* 「~する。」のSURUです。「。」は句読点であり、〇ー〇〇グ娘"。"のようなポップな印象を持たせようと付与しました。

# リンク
* https://serene-thicket-87015.herokuapp.com
* 上記のリンクよりログインが可能です。

# テストユーザー
* 名前: aaa
* メールアドレス: aa@gmail.com
* パスワード: aaaabbbb

# 使用技術一覧
* ruby 2.5.1
* rails 5.2.4.1
* JQuery 4.3.5
* MySQL 5.6.47
* Haml 5.1.2
* Sass 3.7.4
* Rspec 3.9.0
* Heroku
* Github

# 活用方法
# ①グループ編集
* 左サイドバーの所属group選択後、右側にコメント欄上部、グループ名横にアイコンが表示されます。それをクリックしていただくとグループ編集ページに遷移します。そこでグループ名編集、メンバーを追加&削除することができます。以下のgifを参考にしてください。
* ![Image from Gyazo](https://i.gyazo.com/df7b8f615a188632d4ed5ba35adbfe0e.gif)](https://gyazo.com/df7b8f615a188632d4ed5ba35adbfe0e)


# ②コメント&削除
* コメント欄下部からコメントを投稿できます。投稿されたコメントのダストアイコンをクリックしていただくとコメントを削除できます。以下のgifを参考にしてください
* ![Image from Gyazo](https://i.gyazo.com/2f265a21d95cc1dce2f7fe6461fb9aba.gif)](https://gyazo.com/2f265a21d95cc1dce2f7fe6461fb9aba)

# ③グループに所属するメンバーのコメント一覧。
* グループ名横のオレンジで囲まれた各メンバーをクリックしていただくと、メンバーのコメント一覧を見ることができます。
* ![Image from Gyazo](https://i.gyazo.com/c363bba660080ba63118c8f97ba66547.gif)](https://gyazo.com/c363bba660080ba63118c8f97ba66547)

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|

### Association
- has_one :profile
- has_one :creditcard
- has_many :products


## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|lastname|string|null: false|
|lastname_kana|string|null: false|
|firstname|string|null: false|
|firstname_kana|string|null: false|
|birthday|date|null: false|
|postal_code|string|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|tel|string||


### Association
- belongs_to :user


## creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_id|integer|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|customer_id|integer|null: false, foreign_key: true|


### Association
- belongs_to :user


## productsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false,foreign_key: true|
|brand|string|
|item_name|string|null: false|
|item_detail|text|null: false|
|item_size|string||
|condition_id|references|null: false,foreign_key: true|
|price|integer|null: false|
|category_id|references|null: false,foreign_key: true|
|delivery_pay_id|references|null: false,foreign_key: true|
|prefecture_id|references|null: false,foreign_key: true|
|lead_time|string|null: false|
|ststus|integer|null: false|



### Association
- belongs_to :user
- belongs_to :category
- has_many :images


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product|references|null: false, foreign_key: true|


### Association
- belongs_to :product


## categorysテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer||


### Association
- has_many :products
