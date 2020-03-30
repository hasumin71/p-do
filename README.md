# SURU。
* グループチャットのようなtodoアプリを作成しました.
* グループに所属したユーザーが、タスク投稿(todo)&タスクを削除することができ、グループに所属するメンバーのコメント一覧を見ることができます。
* 制作期間：約2週間

# 開発の動機
* twitterのような感覚で、todoを気楽に書いて友達と励まし合えるフィールドを作りたいと思い、開発に至りました。

# アプリ名の由来
* 「~する。」のSURUです。「。」は句読点であり、〇ー〇〇グ娘"。"のようにポップな印象を持たせようと思い付与しました。

# 課題&今後実装したい機能
* ル-ティングをネストしているためか、追加実装が難しいことに気づいた。今後はタスクを削除する前にタスクに取り消し線をつけ、コメントやいいね機能を追加実装していきたい。

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
# ①コメント&削除
* 左サイドバーの所属groupクリック後、タスク欄下部からタスクを投稿できます。投稿されたタスクのゴミ箱アイコンをクリックしていただくとタスクを削除できます。以下のgifを参考にしてください
* ![2f265a21d95cc1dce2f7fe6461fb9aba](https://user-images.githubusercontent.com/60636877/77875767-01d5d400-728c-11ea-8d35-36884ace66e1.gif)


# ②グループに所属するメンバーのコメント一覧。
* グループ名横のオレンジで囲まれた各メンバーをクリックしていただくと、メンバーのタスク一覧を見ることができます。
* ![c363bba660080ba63118c8f97ba66547](https://user-images.githubusercontent.com/60636877/77875568-6f353500-728b-11ea-9c0e-091bccd4d435.gif)


# ③グループ編集
* 上部、グループ名横にアイコンが表示されます。それをクリックしていただくとグループ編集ページに遷移します。そこでグループ名編集、メンバーを追加&削除することができます。以下のgifを参考にしてください。
* ![df7b8f615a188632d4ed5ba35adbfe0e](https://user-images.githubusercontent.com/60636877/77875662-b8858480-728b-11ea-89bb-96db3d234a2d.gif)



## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :tasks
- has_many :groups, through::users_groups
- has_many :users_groups


## tasksテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|
|user_id|integer|null: false,foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|


### Association
- has_many :users,through: users_groups
- has_many :tasks
- has_many :users_groups

## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false,foreign_key: true|
|group_id|integer|null: false,foreign_key: true|


### Association
- belongs_to :group
- belongs_to :user