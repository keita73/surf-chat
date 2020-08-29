SURF-CHAT
====
波情報チャットアプリ。
画像、テキストの投稿が可能です。
地域毎のTweet機能。

## Description
1対多、多対多などを含む[データベース設計](#Database)。
haml記法、SASSによる、ビュー作成。
ajaxを用いた、非同期通信による投稿、自動スクロール、自動更新機能の実装。


## Demo
<img width="1440" alt="スクリーンショット 2020-08-27 16 50 34" src="https://user-images.githubusercontent.com/67895874/91633629-f34f3c80-ea24-11ea-9d57-76b2960cd7b6.png">

## Dependency
言語: Ruby 2.5.1
フレームワーク: Ruby on Rails
gem: 'haml-rails', 'font-awesome-rails', 'devise', 'carrierwave', 'mini_magick', 'fog-aws', 'capistrano', 'unicorn'など


# Database
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|encrypted_password|string|
|reset_password_token|string|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|


### Association
- has_many :groups, through: :groups_users
- has_many :messages
- has_many :groups_users
- has_many :tweets


## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|name|index|unique: false|


### Association
- has_many :users, through: :groups_users
- has_many :messages
- has_many :groups_users
- has_many :tweets


## groups_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references| foreign_key: true|
|group|references| foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|content|string|
|image|string|
|user|references| foreign_key: true|
|group|references| foreign_key: true|

- belongs_to :user
- belongs_to :group


## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|text|string|
|image|text|
|user|references| foreign_key: true|
|group|references| foreign_key: true|
|user_id|integer|

- belongs_to :user
- belongs_to :group
 

 