#!/usr/bin/env Rscript
# 02-install-r-packages.R
# Installs the R packages required to run the soil data curation workflow.
#
# The deepseek-r1 snap is invoked directly via the `deepseek-r1 chat` CLI
# command using base R's system() function — no additional HTTP or JSON
# packages are required.
#
# Requirements:
#   - R (>= 4.0.0)
#   - Internet access to reach a CRAN mirror (only needed during installation)
#   - The deepseek-r1 inference snap installed locally (see src/01-install-snap.sh)
#
# Usage:
#   Rscript src/02-install-r-packages.R

# Packages required by the soil data curation workflow
pkgs <- c(
  "data.table",  # Fast data manipulation
  "sf",          # Spatial data handling
  "mapview"      # Interactive spatial data visualization
)

# Install only packages that are not yet available in the current R library
to_install <- pkgs[!vapply(pkgs, requireNamespace, logical(1L), quietly = TRUE)]

if (length(to_install) == 0L) {
  message("All required packages are already installed.")
} else {
  message("Installing missing packages: ", paste(to_install, collapse = ", "))
  install.packages(to_install, repos = "https://cloud.r-project.org")
  message("Installation complete.")
}
