# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rohoarau <marvin@42lausanne.ch>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/06/28 13:26:28 by rohoarau          #+#    #+#              #
#    Updated: 2022/06/28 14:21:11 by rohoarau         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME 		=	cub3d
OBJ_DIR		=	obj/
SRCS_DIR	=	src/
SRCS		=	main.c				\
				parsing.c			\
OBJS	= $(addprefix $(OBJ_DIR), $(SRCS:.c=.o))
MLX		= libmlx.a
CFLAGS = -Wall -Wextra -Werror
DEBUGGING = -ggdb
CC = gcc
RM = rm -rf
AR = ar rc

all: $(NAME)

$(OBJ_DIR)%.o : $(SRCS_DIR)%.c
		make -C mlx/
		mkdir -p $(OBJ_DIR)
		$(CC) -c $(CFLAGS) $(DEBUGGING) $< -o $@

$(NAME): $(OBJS)
		$(CC) $(CFLAGS) $(OBJS) -Lmlx -lmlx -framework OpenGL -framework AppKit -o $(NAME)

clean:
		make -C mlx clean
		$(RM) $(OBJ_DIR)
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY: all clean re fclean
