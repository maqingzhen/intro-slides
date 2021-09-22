#!/bin/bash
export UCX_GLEX_EP_HC_MR=1

yhrun --mpi=pmix -N 2 -n 112 -p thcp1 ./mpi_nbody_basic 800 1000 0.01 100 g
