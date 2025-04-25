var=$(find models -type d -name "offline-run*")

for dir in $var; do 
    wandb sync --no-include-synced $dir 
done 

echo "wandb sync complete"