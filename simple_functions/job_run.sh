#!/bin/bash
#SBATCH --job-name=in_context_learning_mamba
#SBATCH --time=0-00:10:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=64G
#SBATCH --output=logs/out.%j-%x-%2t
#SBATCH --gres=gpu:a100:1
#SBATCH --partition=gpu
#SBATCH --mail-type=END
#SBATCH --mail-user=stchiu@tamu.edu

module load GCC/12.3.0  OpenMPI/4.1.5 #PyTorch/2.1.2-CUDA-12.1.1
#source ../torch_venv/bin/activate

module load Anaconda3/2024.02-1
source activate in-context-learning-mamba
nvidia-smi
which python
#cp -r ./data $TMPDIR

# jobstats -t -s &
#python ./main.py --device cuda --batch_size 2500 --data_dir $TMPDIR/data/061/train --test_dir $TMPDIR/data/061/test
PYTHONPATH=/scratch/user/stchiu/.conda/envs/in-context-learning-mamba/bin/python
cd src
sh experiments.sh
cd ..
# jobstats