resource "aws_db_instance" "My-RDS" {
    allocated_storage = 10
    db_name = "gfgdb"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    username = "admin"
    password = "Hitesh111"
    parameter_group_name = "default.mysql5.7"
    skip_final_snapshot = true
    }