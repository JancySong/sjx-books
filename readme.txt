在使用本系统时需要配置相关的参数才可使用
请修改 等号（=）后面的具体配置内容
1.系统发送激活邮件所用发信邮箱的配置（email.properties）
mail.from=xxxxxx@163.com		--	发信邮箱账号名称
mail.host=smtp.163.com			--	发信邮箱的SMTP服务地址
mail.username=xxxxxx@163.com	--	发信邮箱账号（需要开启SMTP服务）
mail.password=xxxxxx			--	发信邮箱密码

2.数据库服务配置（config.properties）
jdbc_url=jdbc:mysql://localhost:3306/booksdb	--	数据库服务地址
jdbc_username=songjianxi						--	数据库登录名
jdbc_password=songjianxi						--	数据库登录密码

3.图片存储路径（config.properties）
upload.savePath=C\:\\JavaLibs\\apache-tomcat-7.0.64\\webapps\\imgserver\\images
图片服务器所在路径

