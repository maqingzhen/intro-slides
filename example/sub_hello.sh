#!/bin/bash
yhrun -N 1 -n 4 -p thcp1 ./mpi_hello    # 同时指定 -N 节点数 和 -n 进程数, 来控制
#yhrun -N 2 -n 4 -p thcp1 ./mpi_hello   # 每个节点运行的进程数
#yhrun -n 4 -p thcp1 ./mpi_hello        # 如果 -n 所带参数小于56，可以不指定-N
