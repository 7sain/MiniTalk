# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hualhash <hualhash@student.42abudhabi.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/21 22:02:33 by hualhash          #+#    #+#              #
#    Updated: 2023/01/21 23:12:40 by hualhash         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk

PRNTF_LIB = ./ft_printf/libftprintf.a

$(PRNTF_LIB):
	make -C ./ft_printf

CC = gcc

CFLAGS = -Wall -Wextra -Werror

RM		= rm -f

SRCS =	server.c
SRCC =	client.c

OBJS = $(SRCS:c=o)
OBJC = $(SRCC:c=o)

$(NAME): $(OBJS) $(OBJC)
		$(CC) $(CFLAGS) $(OBJS) -o server $(PRNTF_LIB)
		$(CC) $(CFLAGS) $(OBJC) -o client $(PRNTF_LIB)

%.o : %.c
	${CC} ${CFLAGS} -c $^

all:	$(PRNTF_LIB) $(NAME)

clean:
		@$(RM) $(OBJS) $(OBJC)

fclean:	clean
		$(RM) server client
		make fclean -C ./ft_printf

re:		fclean all
