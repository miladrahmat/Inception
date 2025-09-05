GREEN := $(shell echo -e "\e[1;92m")
CYAN := $(shell echo -e "\e[1;36m")
RED := $(shell echo -e "\e[1;31m")
YELLOW := $(shell echo -e "\e[1;93m")
RESET := $(shell echo -e "\e[0m")

DATA_DIR := /home/mrahmat-/data/dockervolumes
DB_DATA_DIR := $(DATA_DIR)/mariadb
WP_DATA_DIR := $(DATA_DIR)/wordpress

COMPOSE_FILE := ./srcs/docker-compose.yml

all:
	@echo "$(YELLOW)	---BUILDING CONTAINERS---$(RESET)"
	@docker compose -f $(COMPOSE_FILE) up -d && \
		echo "$(GREEN)	---CONTAINERS ARE READY AND STARTED!---$(RESET)" || \
		echo "$(RED)	---SOMETHING WENT WRONG.. ABORTING..---$(RESET)"

db_data:
	@mkdir -p $(DB_DATA_DIR)

wp_data:
	@mkdir -p $(WP_DATA_DIR)

clean:
	@echo "$(CYAN)	---DELETING CONTAINERS AND IMAGES---$(RESET)"
	@docker compose -f $(COMPOSE_FILE) down --rmi all

fclean:
	@echo "$(CYAN)	---DELETING ALL DATA---$(RESET)"
	@sudo rm -fr $(DATA_DIR)
	@docker system prune -f --volumes

re: fclean all

.PHONY: all clean fclean re db_data wp_data