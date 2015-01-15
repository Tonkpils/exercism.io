NAME  = exercismio
DB_NAME = exercismio_postgres
DB_IMAGE = exercism/postgres

all : build

build :
	docker build -t $(NAME) .

db :
	@docker run --name $(DB_NAME) -e POSTGRES_USER=exercism -d $(DB_IMAGE)

run : clean db
	docker run -it --rm -p 4567:4567 \
		--link '$(DB_NAME):db' \
		$(NAME) bash -c \
		'export DB_NAME=exercism_development; \
		source $$APP/config/env; \
		cd $$APP; \
		rake db:migrate; \
		foreman start'
	@docker rm -f $(DB_NAME)

clean :
	@-docker rm -v -f $(DB_NAME) > /dev/null 2> /dev/null

.PHONY: all db clean
