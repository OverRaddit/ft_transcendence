# =============================================================================
# Color Variables
# =============================================================================
BLACK		= 	"\033[0;30m"
GRAY		= 	"\033[1;30m"
RED			=	"\033[0;31m"
GREEN		=	"\033[0;32m"
YELLOW		=	"\033[1;33m"
PURPLE		=	"\033[0;35m"
CYAN		=	"\033[0;36m"
WHITE		=	"\033[1;37m"
EOC			=	"\033[0;0m"
LINE_CLEAR	=	"\x1b[1A\x1b[M"

# =============================================================================
# File Variables
# =============================================================================
NAME		=	pong

# =============================================================================
# Target Generating
# =============================================================================
$(NAME)			:
	@echo $(YELLOW) "Composing docker system from docker-compose.yaml..." $(EOC)
	@sh init.sh
	@mkdir -p ./database ./backend/uploads ./uploads
	@docker-compose up --build
#	@echo $(GREEN) "Docker compose complete!" $(EOC)

# =============================================================================
# Rules
# =============================================================================
all			:	$(NAME)

backend		:
				@cd ./srcs ; docker-compose exec backend bash ; cd ..

frontend		:
				@cd ./srcs ; docker-compose exec frontend bash ; cd ..

postgres		:
#				@cd ./srcs ; docker-compose exec postgres bash ; cd ..
				docker exec -it postgres psql -U postgres -d ft_db

fclean		:
				@echo $(YELLOW) "Removing All Docker things..." $(EOC)
				@echo y | docker system prune -a
				@docker volume prune
				@echo $(RED) "All Docker things are removed! 🗑 🗑\n" $(EOC)

re			: fclean all

.PHONY		: all clean fclean re
