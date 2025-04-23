for seed in 1 2 3
  do
    for setting in skewed_linear_regression linear_regression decision_tree sparse_linear_regression relu_2nn_regression
        do
          for model in gpt2 mamba
            do
              # Job to perform
              /scratch/user/stchiu/.conda/envs/in-context-learning-mamba/bin/python train.py --config conf/${setting}_${model}.yaml --training.seed ${seed}
            done
      done
done

# Print some Information about the end-time to STDOUT
echo "DONE";
echo "Finished at $(date)";

# python train.py --config conf/linear_regression_gpt2.yaml --training.seed 100