Vagrant+Docker+rails+mysql+Apache
===========

環境構築手順
------------

### 準備
Windowsの人はwinnfsdプラグインをインストール
```bash
vagrant plugin install vagrant-winnfsd
```

docker-composeプラグインをインストール
```bash
vagrant plugin install vagrant-docker-compose
```

展開するディレクトリに移動
```bash
cd /path/to
```

gitからクローン
```bash
git clone ssh://git@github.com:s-shoichi/docker_vagrant_rails.git
```

プロジェクトディレクトリに移動
```bash
cd /path/to/docker_vagrant_rails
```

docker/.env.sampleをコピーして docker/.env ファイルを作成
```bash
cp docker/.env.sample docker/.env
cp .env.sample .env
```

### インストール
Vagrantを起動
```bash
vagrant up
```

仮想環境内でDBを作成
```bash
vagrant ssh
cd ~/share/docker
docker-compose exec app bundle exec rails db:migrate:reset
```

アクセス
------------
### Web
https://docker.rails-tst
### MailCatcher
http://docker.rails-tst:1080

基本操作
------------

### 起動(基本的にvagrant upで自動起動)
```bash
cd ~/share/docker && docker-compose up -d
```

### 停止
```bash
cd ~/share/docker && docker-compose down
```

### テストコード実行
```bash
cd ~/share/docker && docker-compose exec app rails rspec
```

### コードスタイル検査
```bash
cd ~/share/docker && docker-compose exec app rubocop app/controllers app/models app/helpers
```

### 複雑度検査(tmp/rubycriticに結果htmlを作成)
```bash
cd ~/share/docker && docker-compose exec app rubycritic --no-browser app
```

### コードスタイル自動修正
```bash
cd ~/share/docker && docker-compose exec app rubocop --auto-correct
```

### 起動状態保持(コンソールからデバックする人向け)
```bash
docker attach docker_app_1
```

### debug-ideを起動(エディタからデバックする人向け)
docker/.envに `ENABLE_REMOTE_DEBUG=yes` を追加する
```bash
cd ~/share/docker && docker-compose down && docker-compose run -d -p 3000:3000 -p 1234:1234 -p 26162:26162  app rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- bin/rails s -b 0.0.0.0
```

注意事項
------------

### railsの初期プロジェクト状態の為、変更する場合
rails/ 配下の
* config/database.yml  
* config/puma.rb  
* config/secrets.yml  
* config/environment.rb(必要に応じて)  
* config/environments/*  
をプロジェクト新規作成後入れ替え。
