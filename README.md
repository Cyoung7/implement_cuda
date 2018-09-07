# implement_cuda

环境:ubunut16.04 gtx1070 cuda9.0 cuDnn7.0 eclipes c++ IDE

cuda入门,所有代码均来自NV docs,cuda by example,professional cuda c programming,代码添加详细注释,如有错误,请友情交流

下面给出cuda小白上手指南:

## 1.驱动,cuda,cnDnn安装

这部分网上[教程](http://www.52nlp.cn/%E6%B7%B1%E5%BA%A6%E5%AD%A6%E4%B9%A0%E6%9C%8D%E5%8A%A1%E5%99%A8%E7%8E%AF%E5%A2%83%E9%85%8D%E7%BD%AE-ubuntu17-04-nvidia-gtx-1080-cuda-9-0-cudnn-7-0-tensorflow-1-3)很多,不细说,但是这一步很折腾,耐心安装

## 2.安装IDE

现在cuda被安装在 `/usr/local/cuda-9.0`

该版本的所有官方文档被存放在`/usr/local/cuda-9.0/doc`下

`pdf/`目录下的

`Nsight_Eclipse_Plugins_Installtion_Guide.pdf`

- [下载IDE](http://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/luna/SR2/eclipse-cpp-luna-SR2-linux-gtk-x86_64.tar.gz)
- 打开eclipes: help > Install New Software, add Respository,插件地址`/usr/local/cuda/nsightee_plugins/`,点击OK

## 3.创建项目

 `Nsight_Eclipse_Edition_Getting_Started.pdf` ,Chapter 3







