#添加一个门店添加时间的字段
ALTER TABLE t_sp_store ADD add_time int(11) COMMENT '添加时间';


#添加一个字段，让门店也关联一个销售人员
ALTER TABLE t_sp_store add salesman_id int(11) COMMENT '销售人员id';

#设置默认管理员密码
update `chamatou`.`t_adminuser` set `username`='admin', `real_name`='昂恪网络', `phone`='13812345678', `auth_key`='HLUlrS3KTOEpA8M6r9h3-VzQ6O6PiNV5', `password_hash`='$2y$13$K2cDIFZqHWavrmhsXx/Boel143GAmeplbF0KeIbk01yWJnge09IFO', `password_reset_token`=null, `email`='a@a.com', `status`='10', `created_at`='0', `updated_at`='0' where `id`='1';