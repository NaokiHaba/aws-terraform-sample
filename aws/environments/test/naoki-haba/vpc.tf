resource "aws_vpc" "main" {
  # 10.0.0.0 ~ 10.0.255.255 までのIPアドレスを割り当てる
  cidr_block = "10.0.0.0/16"
}