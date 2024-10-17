
# Dockerfile for R and Miniconda Environment

This Dockerfile sets up a comprehensive development environment based on R and Miniconda, optimized for bioinformatics and single-cell analysis. It installs a variety of R packages, system dependencies, and additional tools necessary for your data analysis workflows.

## Base Image

The image is built from the latest `rocker/verse` image, which includes R and essential R packages.

## Configuration

- Copies a custom `rstudio-prefs.json` to configure RStudio preferences.
- Installs Fira Code fonts for better readability in RStudio.

## Usage

To build the Docker image:

```bash
docker build -t r_miniconda_env .
```

Run docker locally:

```bash
docker run -it --rm -p 8787:8787 vdsukhov/rstudio-docker:latest
```

Navigate to the http://localhost:8787
- Username: rstudio
- Password: copy from the terminal
