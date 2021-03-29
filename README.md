![Gravy Logo](https://user-images.githubusercontent.com/74521093/105895448-e036ac00-6058-11eb-87f9-494ca7686e31.png)

## :honey_pot: About Gravy (グレイビーについて)

グレイビー(Gravy)は C2C のフードデリバリーを実現するためのプラットフォームです。

※実取引は不可能です

## :earth_americas: URL (本番環境)

http://18.180.105.125/

### Basic 認証

- Username : gravy
- Password : 0096

商品一覧、商品詳細、商品検索及びシェフ一覧、シェフ詳細、シェフ検索についてはログインなしで使用可能です。  
カート機能を試すには、新規登録/ログインが必要です。ログインにあたっては、以下の登録済みアカウントをご利用いただけます。

- email : tokyo@tokyo
- password : sample1

※本番環境ではテストカードの使用ができないため、商品の購入はローカル環境でお試しください。

## Demo (デモ)

| Home                                                                                                                      |
| ------------------------------------------------------------------------------------------------------------------------- |
| ![Gravy: Homepage](https://user-images.githubusercontent.com/74521093/106019267-cef7a900-6105-11eb-9b12-545c4c40f106.png) |

| Area Search                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------- |
| ![area-search](https://user-images.githubusercontent.com/74521093/110434952-c4adcf00-80f5-11eb-993a-cacf2f58cf8e.gif) |

| Dish Search                                                                                                           |
| --------------------------------------------------------------------------------------------------------------------- |
| ![dish-search](https://user-images.githubusercontent.com/74521093/112797359-3d28ff80-90a6-11eb-9196-6d382268772a.jpg) |

| Dish Profile      |
| ----------------- |
| ![dish-profile]() |

| Chef Profile                                                                                                           |
| ---------------------------------------------------------------------------------------------------------------------- |
| ![chef-profile](https://user-images.githubusercontent.com/74521093/112797344-3ac6a580-90a6-11eb-84c5-32af76b2d326.jpg) |

## What brought me to make this app (アプリ作成の動機)

コロナ禍で大きな打撃を受けている飲食業界で働く人々の手助けになるようなサービスを作りたいと考える中で今回のアプリを思いつきました。
また、どのお店の料理を食べるかということではなく、誰が作ったものかという付加価値を料理に与えることができるサービスとしても面白いと思ったので作成しました。

## Functions (機能)

- devise を用いたユーザー及びシェフの新規登録とログイン
- 料理・シェフ・地域に紐付いた検索機能
- 買い物かご機能（複数商品同時購入機能）
- かご内の料理にシェフの一意性を持たせる機能
- 非同期通信による料理お気に入り機能
- PAY.JP を用いたクレジットカードの登録及び購入処理
- RSpec を使ったモデルの単体テストコード
- capistrano による AWS EC2 への自動デプロイ

## 🙌 Check It on Local (ローカル環境でお試し)

```
$ git clone
$ cd gravy-32310
$ bundle install
```

商品一覧、商品詳細、商品検索についてはログインなしで使用可能です。  
商品の購入/カート機能には、新規登録/ログイン、マイページ(my account)でのクレジットカードの登録及び送付先住所の登録が必要です。

また、クレジットカードについては、以下のテストカードをご利用ください。  
※ご自身のカードは使用しないで下さい。

- number : 4242424242424242
- expiration date : 01/23
- cvc : 123

## Supplementary information

- Ruby 2.6.5
- Ruby on Rails 6.0.3.4

## Entity Relationship Diagram (ER 図)

## :copyright: License

#### Gravy is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

Copyright (c) 2021 swata-dev  
Released under the MIT license https://opensource.org/licenses/mit-license.php
