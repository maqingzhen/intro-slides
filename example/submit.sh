#!/bin/bash
#SBATCH --job-name=nbody          # -J, 作业名称，方便yhq时查看区分作业信息
#SBATCH --partition thcp1         # -p, 资源分区名称, 在FT2000+系统上为thcp1
##SBATCH --nodes=3                # -N, 指定作业使用的节点数，此处注释掉了
#SBATCH --ntasks=128              # -n, 提交作业的总进程数
#SBATCH --ntasks-per-node=56      # 每个节点上的进程数，因为FT2000+系统上每个节点最多可以运行56个MPI进程，
                                  # 因此这里通过指定总进程数和每个节点进程数的方式来提交作业，作业占用的节点数由slurm计算。
#SBATCH --output=slurm.%x.%j.out  # -o, 指定作业日志输出文件，%x代表作业名，%j表示作业JobId
#SBATCH --error=slurm.%x.%j.err   # -e, 指定作业错误输出文件，%x代表作业名，%j表示作业JobId
##SBATCH --cpus-per-task=1        # 每个进程占用的CPU核数，如果是多线程的数值大于1，此处注释掉了
##SBATCH --mem-per-cpu=4G         # 为每个CPU核分配的内存 (4G is default)，此处注释掉了
##SBATCH --time=00:01:00          # -t, 作业运行的时间限制 (HH:MM:SS)，此处注释掉了
                                  # https://slurm.schedmd.com/sbatch.html
export UCX_GLEX_EP_HC_MR=1

yhrun --mpi=pmix -N ${SLURM_NNODES} -n ${SLURM_NTASKS} -p thcp1 ./mpi_nbody_basic 800 1000 0.01 100 g
