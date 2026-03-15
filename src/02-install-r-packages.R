#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to interact with the local inference snap.
#
# The deepseek-r1 snap ships its own silicon-optimized runtime and is invoked
# directly through its command-line interface (e.g. `deepseek-r1 chat`).
# Prompts are fed via standard input redirection, exactly as in:
#
#   deepseek-r1 chat < prompt_file.txt
#
# This is implemented in R using the built-in system() function, which
# preserves the caller's controlling terminal — a requirement for the readline
# library used by the snap's chat command. No additional R packages are needed
# for snap interaction.
#
# Other packages used in this project (e.g. data.table) should be installed
# separately as needed.
#
# Requirements:
#   - R (>= 4.0.0)
#   - The deepseek-r1 inference snap installed locally (see src/01-install-snap.sh)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# No additional R packages are required to call the deepseek-r1 snap CLI.
# system() from base R is used to invoke `deepseek-r1 chat < prompt_file`.
pkgs <- character(0L)

# Install only packages that are not yet available in the current R library
to_install <- pkgs[!vapply(pkgs, requireNamespace, logical(1L), quietly = TRUE)]

if (length(to_install) == 0L) {
  message("All required packages are already installed.")
} else {
  message("Installing missing packages: ", paste(to_install, collapse = ", "))
  install.packages(to_install, repos = "https://cloud.r-project.org")
  message("Installation complete.")
}
