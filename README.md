![Gravy Logo](https://user-images.githubusercontent.com/74521093/105895448-e036ac00-6058-11eb-87f9-494ca7686e31.png)


## :honey_pot: About Gravy (グレイビーについて)
グレイビー(Gravy)はC2Cのフードデリバリーを実現するためのプラットフォームです。
  
※実取引は不可能です

## :earth_americas: URL (本番環境)
http://18.180.105.125/

##  Demo (デモ)

| Home |
|----| 
| ![Gravy: Homepage](https://user-images.githubusercontent.com/74521093/106019267-cef7a900-6105-11eb-9b12-545c4c40f106.png) | 

### Home
![Gravy: Homepage](https://user-images.githubusercontent.com/74521093/106019267-cef7a900-6105-11eb-9b12-545c4c40f106.png)
## What brought me to make this app (アプリ作成の動機)



## Functions (機能)
- deviseを用いたユーザー新規登録とログイン
- cancancanを用いた管理者権限の付与
- rails_adminを用いた管理者ページ作成及び商品登録
- カート機能
- 非同期通信による商品お気に入り機能
- 非同期通信による商品へのコメント機能
- gretelを用いたパンくずリスト
- PAY.JPを用いたクレジットカードの登録及び購入処理
- RSpecを使ったモデルの単体テストコード
- capistranoによるAWS EC2への自動デプロイ

## 🙌 Check It on Local (ローカル環境でお試しください)
```
$ git clone 
$ cd gravy-32310
$ bundle install
```

商品一覧、商品詳細、商品検索についてはログインなしで使用可能です。  
商品の購入/カート機能には、新規登録/ログイン、マイページ(my account)でのクレジットカードの登録及び送付先住所の登録が必要です。  
ログインにあたっては、以下の登録済みアカウントをご利用いただけます。  
- email           :
- password        :

また、クレジットカードについては、以下のテストカードをご利用ください。  
※ご自身のカードは使用しないで下さい。  

- number          : 4242424242424242
- expiration date : 01/23
- cvc             : 123

## Supplementary information
- Ruby 2.6.5
- Ruby on Rails 6.0.3.4

## Entity Relationship Diagram (ER図)

## :copyright: License
 
#### Gravy is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

Copyright (c) 2021 swata-dev  
Released under the MIT license https://opensource.org/licenses/mit-license.php