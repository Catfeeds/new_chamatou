#添加一个门店添加时间的字段
ALTER TABLE t_sp_store ADD add_time int(11) COMMENT '添加时间';


#添加一个字段，让门店也关联一个销售人员
ALTER TABLE t_sp_store add salesman_id int(11) COMMENT '销售人员id';
