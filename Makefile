######################################
# Target
######################################
TARGET=msolpp

# location of top level makefile
LEVEL=..

#
# Bring in local variables.
#
include $(LEVEL)/Makefile.local

BUILD_DIR_ABSOLUTE:=$(if $(patsubst /%,,$(BUILD_DIR)),,1)

ifeq ($(BUILD_DIR_ABSOLUTE),1)
BUILD_DIR:=$(BUILD_DIR)/lpp
else
BUILD_DIR:=$(LEVEL)/$(BUILD_DIR)/lpp
endif

######################################
# Sources
######################################

# C sources
C_SOURCES = $(wildcard *.c)
C_SOURCES += $(wildcard ../mso_shared/src/mso_shared/*.c)

# ASM sources
ASM_SOURCES = $(wildcard *.S)

# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =			\
-I.						\
-I${SDKROOT}/firmware/u3p_firmware/inc

#######################################
# Build rules
#######################################

# default build action
all: $(BUILD_DIR)/$(TARGET).a

#######################################
# Dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

include $(LEVEL)/Makefile.common
