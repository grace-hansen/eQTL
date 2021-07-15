#!/bin/bash
#SBATCH --mem=16000
#SBATCH --time=24:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --partition=broadwl 
#SBATCH --job-name=eQTL_chr<chr>
#SBATCH --output=eQTL_chr<chr>.out
