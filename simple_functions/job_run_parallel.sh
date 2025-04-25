#!/bin/bash
#SBATCH --job-name=in_context_learning_mamba_parallel
#SBATCH --time=1-00:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --gres=gpu:a100:2
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=8G
#SBATCH --output=logs/out.%j-%x-%2t
#SBATCH --partition=gpu
#SBATCH --mail-type=END
#SBATCH --mail-user=stchiu@tamu.edu

py=/scratch/user/stchiu/.conda/envs/in-context-learning-mamba/bin/python

module load GCC/12.3.0  OpenMPI/4.1.5 #PyTorch/2.1.2-CUDA-12.1.1
#source ../torch_venv/bin/activate

module load Anaconda3/2024.02-1
source activate in-context-learning-mamba
nvidia-smi
cd src

#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/linear_regression_gpt2.yaml &
#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/linear_regression_mamba.yaml &
#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/relu_2nn_regression_gpt2.yaml &
#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/relu_2nn_regression_mamba.yaml &

wait