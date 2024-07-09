create table eld_user
(
    user_id      int auto_increment comment '主键' primary key,
    user_acc     varchar(32) null comment '账号',
    user_pwd     varchar(32) null comment '密码',
    user_name    varchar(32) null comment '姓名',
    user_sex     char null comment '性别',
    user_age     int null comment '年龄',
    user_phone   varchar(32) null comment '电话',
    user_address varchar(32) null comment '地址',
    status       int default 1 null comment '状态(1 正常 0 禁用)'
) comment '用户';

create table eld_manager
(
    manager_id      int auto_increment comment '主键' primary key,
    manager_acc     varchar(32) null comment '账号',
    manager_pwd     varchar(32) null comment '密码',
    manager_name    varchar(32) null comment '姓名',
    user_sex        char null comment '性别',
    manager_age     int null comment '年龄',
    manager_phone   varchar(32) null comment '电话',
    manager_address varchar(32) null comment '地址',
    status          int default 1 null comment '状态(1 正常 0 禁用)'
) comment '管理员';

create table eld_serve
(
    serve_id      int auto_increment comment '主键' primary key,
    serve_name    varchar(32) null comment '名称',
    serve_cover   varchar(256) null comment '封面',
    serve_content varchar(1024) null comment '内容',
    status        int default 1 null comment '状态（1正常 0禁用）'
) comment '服务';

create table eld_serve_sh
(
    sh_id       int auto_increment primary key,
    sh_serve_id int not null comment '服务',
    sh_user_id  int not null comment '用户',
    sh_date     varchar(32) null comment '日期',
    sh_check    varchar(32) default '待审核' null comment '审核',
    sh_advice   varchar(32) null comment '意见',
    status      int         default 1 null comment '状态（1正常 0禁用）'
) comment '预约';

create table eld_active
(
    active_id      int auto_increment comment '主键' primary key,
    active_name    varchar(32) null comment '名称',
    active_start   varchar(32) null comment '开始',
    active_end     varchar(32) null comment '结束',
    active_address varchar(64) null comment '地址',
    active_phone   varchar(32) null comment '电话',
    active_content text null comment '内容',
    active_cover   varchar(256) null comment '封面',
    status         int default 1 null comment '状态(1 正常 0 禁用)'
) comment '活动';

create table eld_active_sh
(
    sh_id        int auto_increment primary key,
    sh_active_id int not null comment '活动',
    sh_user_id   int not null comment '用户',
    sh_date      varchar(32) null comment '日期',
    sh_check     varchar(32) default '待审核' null comment '审核',
    sh_advice    varchar(32) null comment '意见',
    status       int         default 1 null comment '状态（1正常 0禁用）'
) comment '报名';

create table eld_sort
(
    sort_id   int auto_increment comment '主键' primary key,
    sort_name varchar(32) null comment '名称',
    status    int default 1 null comment '状态(1 正常 0 禁用)'
) comment '类别';

create table eld_sort_news
(
    news_id      int auto_increment comment '主键' primary key,
    news_sort_id int not null comment '类别',
    news_title   varchar(256) null comment '标题',
    news_content text null comment '内容',
    news_date    varchar(32) null comment '日期',
    news_cover   varchar(256) null comment '封面',
    news_read    varchar(32) null comment '阅读',
    status       int default 1 null comment '状态(1 正常 0 禁用)'
) comment '资讯';

create table eld_elder
(
    elder_id      int auto_increment comment '主键' primary key,
    elder_name    varchar(32) null comment '名称',
    elder_content text null comment '内容',
    elder_tag     varchar(32) null comment '标签',
    elder_price   int null comment '价格',
    elder_address varchar(32) null comment '地址',
    elder_date    varchar(32) null comment '成立日期',
    elder_cover   varchar(256) null comment '封面',
    elder_bed     int null comment '房间数',
    elder_area    int null comment '面积',
    elder_phone   varchar(32) null comment '电话',
    elder_jd      varchar(32) null comment '经度',
    elder_wd      varchar(32) null comment '纬度',
    status        int default 1 null comment '状态（1正常 0禁用）'
) comment '养老院';

create table eld_notice
(
    notice_id   int auto_increment comment '主键' primary key,
    notice_name varchar(32) null comment '标题',
    status      int default 1 null comment '状态（1正常 0禁用）'
) comment '公告';

create table eld_review
(
    review_id      int auto_increment comment '主键' primary key,
    review_user_id int null comment '用户',
    review_date    varchar(32) null comment '日期',
    review_content varchar(1024) null comment '内容',
    review_star    int null comment '点赞',
    status         int default 1 null comment '状态(1 正常 0 禁用)'
) comment '评论';
