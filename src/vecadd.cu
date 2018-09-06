#include <iostream>

//using namespace std;

//获取GPU设备信息
void getDeviceInfo(){
	int dev = 0;
	cudaDeviceProp devProp;
	cudaGetDeviceProperties(&devProp, dev);
	std::cout << "使用GPU device " << dev << ": " << devProp.name << std::endl;
//	std::cout << "SP的数量：" << devProp. << std::endl;
	std::cout << "SM的数量：" << devProp.multiProcessorCount << std::endl;
	std::cout << "每个线程块的共享内存大小：" << devProp.sharedMemPerBlock / 1024.0 << " KB" << std::endl;
	std::cout << "每个线程块的最大线程数：" << devProp.maxThreadsPerBlock << std::endl;
	std::cout << "每个SM的最大线程数：" << devProp.maxThreadsPerMultiProcessor << std::endl;
	std::cout << "每个SM的最大线程束数：" << devProp.maxThreadsPerMultiProcessor / 32 << std::endl;
}
// 两个向量加法kernel，grid和block均为一维
__global__ void vecAdd(float* x, float * y, float* z, int n)
{
    // 获取全局索引
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    // 步长
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride)
    {
        z[i] = x[i] + y[i];
    }
}
int testVecAdd(){
	int N = 1 << 20;
	int nBytes = N * sizeof(float);
	// 申请host内存
	float *x, *y, *z;
	x = (float*)malloc(nBytes);
	y = (float*)malloc(nBytes);
	z = (float*)malloc(nBytes);

	// 初始化数据
	for (int i = 0; i < N; i++)
	{
		x[i] = 1.0 * i;
		y[i] = 2.0 * i;
	}

	// 申请device内存
	float *d_x, *d_y, *d_z;
	cudaMalloc((void**)&d_x, nBytes);
	cudaMalloc((void**)&d_y, nBytes);
	cudaMalloc((void**)&d_z, nBytes);

	// 将host数据拷贝到device
	cudaMemcpy((void*)d_x, (void*)x, nBytes, cudaMemcpyHostToDevice);
	cudaMemcpy((void*)d_y, (void*)y, nBytes, cudaMemcpyHostToDevice);
	// 定义kernel的执行配置
	dim3 blockSize(256);
	dim3 gridSize((N + blockSize.x - 1) / blockSize.x);
	// 执行kernel
	vecAdd<<<gridSize, blockSize>>>(d_x,d_y,d_z,N);

	cudaMemcpy((void*)z,(void*)d_z,nBytes,cudaMemcpyDeviceToHost);

	for(int i=0;i < 10;i++){
		std::cout << z[i] << " ";
	}
	cudaFree(d_x);
	cudaFree(d_y);
	cudaFree(d_z);
	free(x);
	free(y);
	free(z);

	return 0;
}

int testMallocManager(){
	int N = 1 << 20;
	int nBytes = N * sizeof(float);

	// 申请托管内存
	float *x, *y, *z;
	cudaMallocManaged((void**)&x, nBytes);
	cudaMallocManaged((void**)&y, nBytes);
	cudaMallocManaged((void**)&z, nBytes);

	// 初始化数据
	for (int i = 0; i < N; ++i)
	{
		x[i] = 1.0 * i;
		y[i] = 2.0 * i;
	}

	// 定义kernel的执行配置
	dim3 blockSize(256);
	dim3 gridSize((N + blockSize.x - 1) / blockSize.x);
	// 执行kernel
	vecAdd << < gridSize, blockSize >> >(x, y, z, N);

	// 同步device 保证结果能正确访问
	cudaDeviceSynchronize();
	// 检查执行结果
	for(int i=0;i < 10;i++){
		std::cout << z[i] << " ";
	}
	// 释放内存
	cudaFree(x);
	cudaFree(y);
	cudaFree(z);

	return 0;
}


