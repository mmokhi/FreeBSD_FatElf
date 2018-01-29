.include <bsd.own.mk>


MAIN_SOURCE_LOCATION= ${.CURDIR}

.PATH: ${MAIN_SOURCE_LOCATION}

KMOD=	fatelf
SRCS=	imgact_elf.c elf_fat.h \
		vnode_if.h vnode_if_typedef.h vnode_if_newproto.h \
		opt_capsicum.h opt_compat.h opt_core.h
CFLAGS+= -I${.CURDIR}

imgact_elf.c:
	cp /usr/src/sys/kern/imgact_elf.c .
	patch -d . < fatelf_patch.patch

rm-trash:
	rm @ x86 machine
	rm *.orig
	rm imgact_elf.c elf_fat.h

.include <bsd.kmod.mk>

