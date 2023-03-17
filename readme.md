# docker-laravel-jit

jitを有効化したdockerによるlaravelの開発環境を即座に構築できます。  
dockerfileでビルドしたイメージはそのまま本番環境にデプロイできます。

## how to

先に下記環境を構築しておいてください。  
<https://github.com/5ym/Local-Dev-Traefik>  
その後下記スクリプトで自動で構築と起動が完了します。

```sh
curl -sf https://raw.githubusercontent.com/5ym/docker-laravel-jit/main/init.sh | sh -s
```

gitのリモートなどはプロジェクト構築後適宜変更してください。

```sh
git remote set-url origin https://hogehoge
```