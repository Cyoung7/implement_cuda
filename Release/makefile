################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm

# All of the sources participating in the build are defined here
-include sources.mk
-include src/professional-cuda-c-programming/chapter01/subdir.mk
-include src/professional-cuda-c-programming/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: implement_cuda

# Tool invocations
implement_cuda: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: NVCC linker'
	/usr/local/cuda/bin/nvcc --cudart=static -ccbin g++ -gencode arch=compute_30,code=sm_30 -gencode arch=compute_30,code=compute_30 -o "implement_cuda" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS) implement_cuda
	-@echo ' '

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
