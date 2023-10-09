provider "aws" {
  region = "ap-northeast-3" # あなたの使用したいリージョンに変更してください
}

resource "aws_instance" "ansible_host" {
  ami           = "ami-063cd3af637f3e426" # Red Hat Enterprise Linux 9 (HVM), SSD Volume Type AMI (HVM) のAMI ID, リージョンによって変更してください
  instance_type = "t2.micro"

  tags = {
    Name = "AnsibleHost"
  }

  key_name = "test_ansible" # あなたのEC2キーペアの名前に変更してください
}
