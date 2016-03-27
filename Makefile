.include <bsd.own.mk>


MAIN_SOURCE_LOCATION= ${.CURDIR}

.PATH: ${MAIN_SOURCE_LOCATION}

KMOD=	fatelf
SRCS=	imgact_elf.c elf_fat.h \
		vnode_if.h vnode_if_typedef.h vnode_if_newproto.h
CFLAGS+= -I${.CURDIR}

.include <bsd.kmod.mk>

