NAME = Arm64

AS = as
LD = ld

SRCS = HelloWorld.s

DEBUGFLGS = -g
LDFLAGS = -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64

MKDIR = mkdir -p
OUT_DIR := out

OBJS = $(addprefix $(OUT_DIR)/,$(SRCS:%.s=%.o))

$(OUT_DIR)/%.o: %.s
	$(MKDIR) $(@D)
	$(AS) $(DEBUGFLGS) $< -o $@

$(NAME): $(OBJS)
	$(LD) $(OBJS)  $(LDFLAGS) -o $(NAME)

all : $(NAME)

clean :
	rm -rf $(OBJS)

fclean : clean

	rm -rf $(NAME)

re : fclean all
