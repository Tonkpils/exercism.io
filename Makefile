NAME  = exercism.io
DB_NAME = exercism.io_postgres
DB_IMAGE = postgres:9.2

all : build

build :
	docker build -t $(NAME) .

db :
	docker run --name $(DB_NAME) -d $(DB_IMAGE)

run	: db
	docker run -it --rm \
		--link '$(DB_NAME):db' \
		-e DATABASE_URL=postgresql://postgres@$$DB_PORT_5432_TCP_ADDR
		$(NAME) bash
	docker stop $(DB_NAME)