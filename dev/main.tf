provider "aws" {
  region = "ap-northeast-3"
}

resource "aws_instance" "ansible_host" {
  ami           = "ami-063cd3af637f3e426"
  instance_type = "t2.micro"

  tags = {
    Name = "AnsibleHost"
  }

  key_name = "test_ansible"
}

output "instance_ip" {
  value = aws_instance.ansible_host.public_ip
  description = "Public IP of the Ansible Host"
}

terraform {
  backend "s3" {
    bucket         = "my-unique-bucket-name-6493000954"   # 作成したS3バケットの名前を指定します。
    key            = "terraform.tfstate"     # S3に保存するステートファイルの名前を指定します。
    region         = "ap-northeast-1"        # S3バケットが存在するリージョンを指定します。
    encrypt       = true                    # ステートファイルをS3に保存する際に暗号化するかどうかを指定します（オプション）。
    # dynamodb_table = "your-dynamodb-table"  # ステートのロックを行うためのDynamoDBテーブル名を指定します（オプション）。
  }
}
