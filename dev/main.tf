provider "aws" {
  region = "us-west-2" # あなたの使用したいリージョンに変更してください
}

resource "aws_instance" "ansible_host" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 LTS AMI (HVM) のAMI ID, リージョンによって変更してください
  instance_type = "t2.micro"

  tags = {
    Name = "AnsibleHost"
  }

  key_name = "test_ansible" # あなたのEC2キーペアの名前に変更してください
}
