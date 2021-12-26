#!/bin/bash
# fetch all the words which is having ##
help:	##show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep

catalogue:	## install catalogue
	@bash Components/catalogue.sh
	
mongodb:	## install mongodb
	@bash Components/mongodb.sh
	
redis:		## install redis
	@bash Components/redis.sh
	
user:		## install user
	@bash Components/user.sh
	
cart:		## install cart
	@bash Components/cart.sh
	
mysql:		## install mysql
	@bash Components/mysql.sh
	
shipping:	## install shipping
	@bash Components/shipping.sh
	
rabbitmq:	## install rabbitmq
	@bash Components/rabbitmq.sh
	
payment:	## install payment
	@bash Components/payment.sh
	
frontend:	## install frontend
	@bash Components/frontend.sh