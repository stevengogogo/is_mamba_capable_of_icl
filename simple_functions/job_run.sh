#!/bin/bash
#SBATCH --job-name=in_context_learning_mamba
#SBATCH --time=0-20:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --mem=64G
#SBATCH --output=logs/out.%j-%x-%2t
#SBATCH --gres=gpu:a100:1
#SBATCH --partition=gpu
#SBATCH --mail-type=END
#SBATCH --mail-user=stchiu@tamu.edu
-
module load GCC/12.3.0  OpenMPI/4.1.5 #PyTorch/2.1.2-CUDA-12.1.1
module load Anaconda3/2024.02-1
source activate in-context-learning-mamba
nvidia-smi
py=/scratch/user/stchiu/.conda/envs/in-context-learning-mamba/bin/python
cd src

#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/linear_regression_gpt2.yaml &
#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/linear_regression_mamba.yaml &
#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/relu_2nn_regression_gpt2.yaml &
#srun -N 1 -n 1 --gres=gpu:1 --exclusive $py train.py --config conf/relu_2nn_regression_mamba.yaml &
#$py train.py --config conf/decision_tree_mamba.yaml
#$py train.py --config conf/sparse_linear_regression_mamba.yaml
#$py train.py --config conf/skewed_linear_regression_mamba.yaml
#$py train.py --config conf/skewed_linear_regression_gpt2.yaml