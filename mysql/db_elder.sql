create table db_elder.eld_active
(
    active_id      int auto_increment comment '主键'
        primary key,
    active_label   varchar(50)   null comment '名称',
    active_start   varchar(50)   null comment '开始',
    active_end     varchar(50)   null comment '结束',
    active_address varchar(50)   null comment '地址',
    active_phone   varchar(50)   null comment '电话',
    active_content text          null comment '内容',
    active_cover   varchar(200)  null comment '封面',
    active_state   int default 1 null comment '状态(1 正常 0 禁用)',
    constraint eld_active_active_id_uindex
        unique (active_id)
)
    comment '活动';


create table db_elder.eld_apply
(
    apply_id     int auto_increment
        primary key,
    apply_acc    varchar(50)               null comment '账号',
    apply_phone  varchar(50)               null comment '电话',
    apply_label  varchar(50)               null comment '名称',
    apply_date   varchar(50)               null comment '日期',
    apply_check  varchar(50) default '待审核' null comment '审核',
    apply_advice varchar(50)               null comment '意见',
    apply_state  int         default 1     null comment '状态（1正常 0禁用）',
    constraint eld_apply_apply_id_uindex
        unique (apply_id)
)
    comment '报名';

create table db_elder.eld_elder
(
    elder_id      int auto_increment comment '主键'
        primary key,
    elder_label   varchar(50)   null comment '名称',
    elder_content text          null comment '内容',
    elder_tag     varchar(50)   null comment '标签',
    elder_price   int           null comment '价格',
    elder_address varchar(50)   null comment '地址',
    elder_date    varchar(50)   null comment '成立日期',
    elder_cover   varchar(200)  null comment '封面',
    elder_bed     int           null comment '房间数',
    elder_area    int           null comment '面积',
    elder_phone   varchar(50)   null comment '电话',
    elder_jw      varchar(50)   null comment '经纬度',
    elder_wd      varchar(50)   null comment '经纬度',
    elder_state   int default 1 null comment '状态（1正常 0禁用）',
    constraint eld_elder_elder_id_uindex
        unique (elder_id)
)
    comment '养老院';

create table db_elder.eld_news
(
    news_id      int auto_increment comment '主键'
        primary key,
    news_title   varchar(200)  null comment '标题',
    news_content text          null comment '内容',
    news_type    varchar(50)   null comment '类别',
    news_date    varchar(50)   null comment '日期',
    news_cover   varchar(200)  null comment '封面',
    news_tag     varchar(50)   null comment '标签',
    news_read    varchar(50)   null comment '阅读',
    news_state   int default 1 null comment '状态(1 正常 0 禁用)',
    constraint eld_news_news_id_uindex
        unique (news_id)
)
    comment '新闻';

create table db_elder.eld_notice
(
    notice_id    int auto_increment comment '主键'
        primary key,
    notice_label varchar(50)   null comment '标题',
    notice_state int default 1 null comment '状态（1正常 0禁用）',
    constraint eld_notice_notice_id_uindex
        unique (notice_id)
)
    comment '公告';

create table db_elder.eld_order
(
    order_id     int auto_increment
        primary key,
    order_acc    varchar(50)   null comment '用户',
    order_date   varchar(50)   null comment '日期',
    order_check  varchar(50)   null comment '审核',
    order_advice varchar(50)   null comment '意见',
    order_state  int default 1 null comment '状态（1正常 0禁用）',
    constraint eld_order_order_id_uindex
        unique (order_id)
)
    comment '预约';

create table db_elder.eld_review
(
    review_id      int auto_increment comment '主键'
        primary key,
    review_name    varchar(50)   null comment '姓名',
    review_date    varchar(50)   null comment '日期',
    review_content varchar(1000) null comment '内容',
    review_star    int           null comment '点赞',
    review_state   int default 1 null comment '状态(1 正常 0 禁用)',
    constraint eld_review_review_id_uindex
        unique (review_id)
)
    comment '评论';

create table db_elder.eld_serve
(
    serve_id      int auto_increment comment '主键'
        primary key,
    serve_cover   varchar(200)  null comment '封面',
    serve_label   varchar(50)   null comment '名称',
    serve_content varchar(1000) null comment '内容',
    serve_state   int default 1 null comment '状态（1正常 0禁用）',
    constraint eld_serve_serve_id_uindex
        unique (serve_id)
)
    comment '服务';

create table db_elder.eld_sort
(
    sort_id    int auto_increment comment '主键'
        primary key,
    sort_label varchar(50)   null comment '描述',
    sort_state int default 1 null comment '状态(1 正常 0 禁用)',
    constraint eld_sort_sort_id_uindex
        unique (sort_id)
)
    comment '类别';

create table db_elder.eld_swiper
(
    swiper_id    int auto_increment
        primary key,
    swiper_label varchar(50)   null comment '名称',
    swiper_src   varchar(200)  null comment '图片',
    swiper_url   varchar(200)  null comment '新闻',
    swiper_state int default 1 null comment '状态（1正常 0禁用）',
    constraint eld_swiper_swiper_id_uindex
        unique (swiper_id)
)
    comment '轮播图';

create table db_elder.eld_user
(
    user_id      int auto_increment comment '主键'
        primary key,
    user_acc     varchar(50)                null comment '账号',
    user_pwd     varchar(50)                null comment '密码',
    user_name    varchar(50)                null comment '姓名',
    user_sex     int         default 2      null comment '性别(0男 1女 2不详)',
    user_age     int                        null comment '年龄',
    user_phone   varchar(50)                null comment '电话',
    user_ide     varchar(50) default '普通用户' null comment '角色',
    user_address varchar(50)                null comment '地址',
    user_state   int         default 1      null comment '状态(1 正常 0 禁用)',
    constraint eld_user_user_id_uindex
        unique (user_id)
)
    comment '用户';

INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (1, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '15', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (2, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:32:57', 'http://43.142.9.86:9090/files/1703838534233-3085808915_14_561_400.jpg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (3, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老政策', '2024-02-29 00:33:26', 'http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/c7315233338256be877b836d42907ef1--1416883533.jpg', NULL, '13', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (4, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/2a2a00207fabfd1fe9f9955100d28441--4106674217.jpg\" alt=\"\" data-href=\"\" style=\"width: 910.00px;height: 511.88px;\"></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 915.00px;height: 609.97px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:34:19', 'http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/2a2a00207fabfd1fe9f9955100d28441--4106674217.jpg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (5, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/8f62504ef8d51b2cd042cdf63b169e35--278618013.jpg\" alt=\"\" data-href=\"\" style=\"width: 735.00px;height: 413.44px;\"></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老政策', '2024-02-29 00:35:13', 'http://cdn-hw-static2.shanhutech.cn/bizhi/staticwp/202301/8f62504ef8d51b2cd042cdf63b169e35--278618013.jpg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (6, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老服务', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (7, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (8, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老服务', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (9, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (10, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老服务', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (11, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (12, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (13, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老模式', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (14, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (15, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '居家养老', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '13', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (16, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '养老动态', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);
INSERT INTO `eld_news` (`news_id`, `news_title`, `news_content`, `news_type`, `news_date`, `news_cover`, `news_tag`, `news_read`, `news_state`) VALUES (17, '情暖寒冬，关爱老人。', '<p style=\"text-align: center;\"><br></p><h2 style=\"text-align: center;\">情暖寒冬，关爱老人。</h2><h5 style=\"text-align: center;\"></h5><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，<span style=\"color: rgb(212, 56, 13);\"><strong>12月26日</strong></span>，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p style=\"text-indent: 2em; text-align: left;\"><br></p><p><br></p><hr/><p style=\"text-indent: 2em; text-align: center;\"><img src=\"http://43.142.9.86/img/1.78018329.jpeg\" alt=\"\" data-href=\"\" style=\"width: 716.00px;height: 477.32px;\"></p><p style=\"text-indent: 2em; text-align: center;\"><br></p><p style=\"text-indent: 2em; text-align: left;\">为进一步弘扬尊老、敬老、爱老的传统美德，做好老年人医疗服务，传播健康理念，12月26日，省市卫健领导、济南市医养健康产业协会“暖冬敬老”系列活动走进历城区养老服务中心。山东省卫生健康委中医产业处处长王萱、济南市卫生健康委医养健康处二级调研员王芝美、历城区卫健局、济南市第三人民医院及等协会相关领导等😀参加活动。现场举行了“暖冬敬老”慰问捐赠仪式、开展了老年营养保健讲座及市立三院的公益诊疗活动。😙😚😇</p><p style=\"text-indent: 2em; text-align: left;\"><br></p><hr/><p><br></p>', '居家养老', '2024-02-29 00:05:46', 'http://43.142.9.86/img/1.78018329.jpeg', NULL, '12', 1);

INSERT INTO `eld_user` (`user_id`, `user_acc`, `user_pwd`, `user_name`, `user_sex`, `user_age`, `user_phone`, `user_ide`, `user_address`, `user_state`) VALUES (1, '1', '1', NULL, 2, NULL, NULL, '普通用户', NULL, 1);
INSERT INTO `eld_user` (`user_id`, `user_acc`, `user_pwd`, `user_name`, `user_sex`, `user_age`, `user_phone`, `user_ide`, `user_address`, `user_state`) VALUES (6, '2', '2', '', 0, 0, '', '管理员', '', 0);

INSERT INTO `eld_order` (`order_id`, `order_acc`, `order_date`, `order_check`, `order_advice`, `order_state`) VALUES (1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `eld_review` (`review_id`, `review_name`, `review_date`, `review_content`, `review_star`, `review_state`) VALUES (1, NULL, NULL, NULL, NULL, 1);
INSERT INTO `eld_active` (`active_id`, `active_label`, `active_start`, `active_end`, `active_address`, `active_phone`, `active_content`, `active_cover`, `active_state`) VALUES (1, '爱心共建聚合力 关爱老人做公益', '2023-12-01', '2023-12-28', '和平东路1221号', '', '', 'http://43.142.9.86:9090/files/1703840827680-微信截图_20231229170703.png', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (1, '全部', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (2, '养老动态', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (3, '养老政策', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (4, '养老服务', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (5, '养老产业', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (6, '养老模式', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (7, '养老金', 1);
INSERT INTO `eld_sort` (`sort_id`, `sort_label`, `sort_state`) VALUES (8, '居家养老', 1);
INSERT INTO `eld_apply` (`apply_id`, `apply_acc`, `apply_phone`, `apply_label`, `apply_date`, `apply_check`, `apply_advice`, `apply_state`) VALUES (1, NULL, NULL, NULL, NULL, '待审核', NULL, 1);
INSERT INTO `eld_elder` (`elder_id`, `elder_label`, `elder_content`, `elder_tag`, `elder_price`, `elder_address`, `elder_date`, `elder_cover`, `elder_bed`, `elder_area`, `elder_phone`, `elder_jw`, `elder_wd`, `elder_state`) VALUES (1, '泰康之家·徽园', '', '', 2199, '111', '2019', 'http://43.142.9.86/img/1.78018329.jpeg', 1230, 600, '13833447788', '117.4', '117.4', 1);
INSERT INTO `eld_elder` (`elder_id`, `elder_label`, `elder_content`, `elder_tag`, `elder_price`, `elder_address`, `elder_date`, `elder_cover`, `elder_bed`, `elder_area`, `elder_phone`, `elder_jw`, `elder_wd`, `elder_state`) VALUES (2, '泰康之家·徽园', NULL, NULL, 2199, '111', '2019', 'http://43.142.9.86:9090/files/1703838534233-3085808915_14_561_400.jpg', 1230, 600, '13833447788', NULL, '117.4', 1);
INSERT INTO `eld_elder` (`elder_id`, `elder_label`, `elder_content`, `elder_tag`, `elder_price`, `elder_address`, `elder_date`, `elder_cover`, `elder_bed`, `elder_area`, `elder_phone`, `elder_jw`, `elder_wd`, `elder_state`) VALUES (3, '泰康之家·徽园', NULL, NULL, 2199, '111', '2019', 'http://43.142.9.86:9090/files/1703840044621-2.jpeg', 1230, 600, '13833447788', NULL, '117.4', 1);
INSERT INTO `eld_elder` (`elder_id`, `elder_label`, `elder_content`, `elder_tag`, `elder_price`, `elder_address`, `elder_date`, `elder_cover`, `elder_bed`, `elder_area`, `elder_phone`, `elder_jw`, `elder_wd`, `elder_state`) VALUES (4, '泰康之家·徽园', NULL, NULL, 2199, '111', '2019', 'http://43.142.9.86:9090/files/1703906855696-微信截图_20231230112730.png', 1230, 600, '13833447788', NULL, '117.4', 1);
INSERT INTO `eld_serve` (`serve_id`, `serve_cover`, `serve_label`, `serve_content`, `serve_state`) VALUES (1, 'http://43.142.9.86:9090/files/1703906855696-微信截图_20231230112730.png', '社区文化服务', '提供丰富多彩的文化娱乐活动，包括舞蹈、歌唱比赛、户外跑步等活动', 1);
INSERT INTO `eld_swiper` (`swiper_id`, `swiper_label`, `swiper_src`, `swiper_url`, `swiper_state`) VALUES (1, '1', 'http://43.142.9.86/img/1.78018329.jpeg', '1', 1);
INSERT INTO `eld_swiper` (`swiper_id`, `swiper_label`, `swiper_src`, `swiper_url`, `swiper_state`) VALUES (2, '2', 'http://43.142.9.86/img/2.952132ef.jpeg', '2', 1);
INSERT INTO `eld_swiper` (`swiper_id`, `swiper_label`, `swiper_src`, `swiper_url`, `swiper_state`) VALUES (3, '3', 'http://43.142.9.86:9090/files/1703906855696-微信截图_20231230112730.png', '3', 1);
INSERT INTO `eld_swiper` (`swiper_id`, `swiper_label`, `swiper_src`, `swiper_url`, `swiper_state`) VALUES (4, '4', 'http://43.142.9.86:9090/files/1703838534233-3085808915_14_561_400.jpg', '4', 1);
INSERT INTO `eld_notice` (`notice_id`, `notice_label`, `notice_state`) VALUES (1, '1', 1);



