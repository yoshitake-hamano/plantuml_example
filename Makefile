SRC_DIR:=src
DAT_DIR:=dat
BUILD_DIR:=build
SOURCES:=$(wildcard $(SRC_DIR)/*.puml)
TARGETS:=$(SOURCES:%.puml=%.png)
TARGETS:=$(TARGETS:$(SRC_DIR)/%=$(BUILD_DIR)/%)

all: $(TARGETS)

.PHONY: clean
clean:
	$(RM) $(TARGETS)

$(BUILD_DIR)/%.png: $(SRC_DIR)/%.puml
	plantuml -Tpng -o ../$(BUILD_DIR) $^

