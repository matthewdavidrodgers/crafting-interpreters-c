SOURCE_DIR := src
BUILD_DIR := build
NAME := clox
CC := clang

CFLAGS := -std=c99 -Wall -Wextra -Werror -Wno-unused-parameter

HEADERS := $(wildcard $(SOURCE_DIR)/*.h)
SOURCES := $(wildcard $(SOURCE_DIR)/*.c)
OBJECTS := $(addprefix $(BUILD_DIR)/, $(notdir $(SOURCES:.c=.o)))

ifeq ($(MODE),release)
	CFLAGS += -O3 -flto
else 
	CFLAGS += -O0 -DDEBUG -g
endif


$(NAME): $(OBJECTS)
	@ printf "%8s %-40s %s\n" $(CC) $@ "$(CFLAGS)"
	@ mkdir -p build
	@ $(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SOURCE_DIR)/%.c $(HEADERS)
	@ printf "%8s %-40s %s\n" $(CC) $< "$(CFLAGS)"
	@ mkdir -p $(BUILD_DIR)
	@ $(CC) -c $(CFLAGS) -o $@ $<

.PHONY: default
