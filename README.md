# Flutter Sample

Flutter のサンプル

```
cd ./flutter
flutter run
```

## design

![デザイン](https://github.com/TocoBird/bulby/blob/main/docs/images/gamerreflection_design_img_thumb.jpg?raw=true)

## api server and database

```
// docker
cd ./api/infrastructure/docker
docker-compose up -d

// create database
```

## test

```
// test
```

# 仕様

## ページ遷移

```
root
├── Register Reflection Name（振り返り名の追加, 初回のみ）
│ ├── Task（タスク一覧）
│ │ ├── Task Detail（タスク詳細と振り返り追加/編集と完了）
│ ├── Add Reflection（振り返りの追加）
│ ├── Ranking（ランキング, 自身の状況, 他ユーザーのランキング）
│ │ ├── Ranking History（ランキングや自身の履歴）
│ ├── Account Setting（アカウント設定, 編集もここで可能）
│ │ ├── Register Reflection Name（新規振り返り名の追加）
```

### ページ遷移 - メモ

- ログイン不要のツールなのでログアウトはない。
