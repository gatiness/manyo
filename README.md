# README

**Task model:** 
|  カラム名  |  データ型  |
| ---- | ---- |
|  priority  |  text   |
|  status  |  text   |
|  task_name  |  string  |
|  task_description  |  string   |

**User model:** 
|  カラム名  |  データ型  |
| ---- | ---- |
|  name   |  string   |
|  email  |  string   |
|  password_digest  |  string   |

**Label model:** (TBD)

-------------------------------------------


**herokuデプロイ手順**

1. herokuログイン

`heroku login`


2. Assetプリコンパイル

`$ rails assets:precompile RAILS_ENV=production`


3. git add & git commit

`$ git add .`

`$ git commit -m ""`


4. heroku create

`$ heroku create`


5. heroku stackを18に変更

`$ heroku stack:set heroku-18`


6. buildpackを入れる

`$ heroku buildpacks:set heroku/ruby`


7. bundle lockを入れる

`$ bundle lock --add-platform x86_64-linux`


8. Heroku masterにpush 

`$ git push heroku master`


9. heroku内でマイグレーション

`$ heroku run rails db:migrate`


10. herokuサーバーを再起動

`$ heroku restart`


11. アクセスして動作確認

`$ heroku config`

