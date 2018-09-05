################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../src/professional-cuda-c-programming/test_professional_cuda_c_programming.cpp 

OBJS += \
./src/professional-cuda-c-programming/test_professional_cuda_c_programming.o 


# Each subdirectory must supply rules for building sources it contributes
src/professional-cuda-c-programming/%.o: ../src/professional-cuda-c-programming/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: NVCC Compiler'
	/usr/local/cuda/bin/nvcc -I"/usr/local/cuda-9.0/samples/1_Utilities" -I"/usr/local/cuda-9.0/samples/common/inc" -O3 -gencode arch=compute_30,code=sm_30 -gencode arch=compute_30,code=compute_30 -ccbin g++ -c -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/professional-cuda-c-programming/test_professional_cuda_c_programming.o: /usr/include/stdc-predef.h /home/cyoung/workspace/implement_cuda/src/professional-cuda-c-programming/include/chapter01_hello.h


