# 万葉課題
## テーブル
|    Users        |    Tasks                  |    Labels    |
|:----------------|---------------------------|--------------|
| user_id         |task_id                    |label_id      |
| user_name       |task_title    *string      |label_name    |
| user_address    |task_content  *text        |label_content |
| user_pass       |task_deadline *date        |              |
|                 |task_status   *string      |              |
|                 |task_priority *boolean     |              |
## herokuへのデプロイ方法
1.heroku login
2.heroku create
3.rails assets:precompile RAILS_ENV=production でアセット類を実際に実行できる形式に変換
4.git push heroku master でデプロイ
5.heroku run rails db:migrate でデータベース移行
## herokuとGithubの連携
1.herokuへアクセス
2.Githubと連携するアプリの選択
3.deployタブを選択
4.[Deployment method]セクションで[GitHub]を選択し、[Connect to GitHub]セクションの[Connect to GitHub]をクリック
5.[Connect to GitHub]で連携するリポジトリを検索・選択して [Connect]をクリック
6.[Automatic deploys]セクションでデプロイするブランチを選択して [Enable Automatic Deploys]をクリック
