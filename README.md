# 概要

勉強用にGitHub Actionsとセルフホストランナーを使用して、AWSインフラストラクチャのデプロイとAnsibleによる構成管理を実施するためのものです。

## ディレクトリ構成

### GitHub Actions ワークフロー

```
.github/workflows/
│
├── aws-policy-setup.yml             # AWSポリシーのセットアップ
├── destory.yml                      # インフラの破棄
├── deploy_ec2_and_playbook.yml      # EC2のデプロイとAnsibleプレイブックの実行
├── create_s3_bucket.yml             # S3バケットの作成
└── install_terraform_and_ansible.yml# セルフホストランナー用TerraformおよびAnsibleのインストール
```

### Terraform インフラストラクチャ

```
environments/
│
├── dev/
│   ├── main.tf      # Dev環境のTerraform構成ファイル
│   ├── backend.tf   # Terraformのバックエンド構成
│   ├── variables.tf # Terraform変数定義
│   └── outputs.tf   # Terraformアウトプット定義
│
├── prd/
│   └── ...           # 本番環境のTerraform構成（略）
│
└── backend.local.tf  # s3 bucket作成時にteraform initするとまだ作成していないため
　　　　　　　　　　　　　　　　　　　　エラーとなるので作成前にローカル-> s3と切り替えるための
　　　　　　　　　　　　　　　　　　　　ローカルバックエンド設定ファイル
```

### Terraform モジュール

```
modules/
│
├── ec2/
│   ├── main.tf      # EC2モジュールのTerraform構成ファイル
│   ├── variables.tf # EC2モジュールの変数定義
│   └── outputs.tf   # EC2モジュールのアウトプット定義
│
├── security_group/
│   └── ...           # セキュリティグループモジュールのTerraform構成（略）
│
├── s3/
│   └── ...           # S3モジュールのTerraform構成（略）
│
└── vpc/
    └── ...           # VPCモジュールのTerraform構成（略）
```

### Ansible プレイブック

```
ansible/
│
├── roles/
│   ├── nginx/        # Nginxロール
│   │   └── tasks/
│   │       └── main.yml # NginxロールのAnsibleタスク
│   └── ...           # 他のAnsibleロール（略）
│
└── site.yml          # Ansibleサイトプレイブック
```

## ワークフローの詳細

1. **install_terraform_and_ansible.yml**
   - **目的**: self-hosted runnerへのTerraformおよびAnsibleのインストール
   - **実施内容**: インフラの構築や構成管理に必要なTerraformとAnsibleをインストールします。

2. **create_s3_bucket.yml**
   - **目的**: S3バケットの作成
   - **実施内容**: Terraformを使用してS3バケットを作成します。

3. **deploy_ec2_and_playbook.yml**
   - **目的**: EC2のデプロイとAnsibleプレイブックの実行
   - **実施内容**: TerraformでEC2をデプロイし、Ansibleで構成管理を行います。

4. **destory.yml**
   - **目的**: インフラの破棄
   - **実施内容**: Terraformを使用してデプロイしたインフラを破棄します。  
   ※一部エラーで失敗するためまだ未完了  
   　s3のバケット内のオブジェクト(tfstate)が削除されていないためバケットの削除がコケる

5. **aws-policy-setup.yml**
   - **目的**: AWSポリシーのセットアップ
   - **実施内容**: AWSポリシーの設定を行います。  
※未実装


各ワークフローについての詳細な設定は、.github/workflows/ディレクトリの該当するファイルを参照してください。
