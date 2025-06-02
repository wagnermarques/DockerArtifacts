# Start from the Jupyter datascience-notebook image
FROM jupyter/datascience-notebook:latest

# Switch to root to install system dependencies if any, then back to jovyan
USER root

# Example: Install system libraries if needed for some Python packages
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     some-system-lib \
#     && rm -rf /var/lib/apt/lists/*

# Switch back to the jovyan user to install Python packages
USER ${NB_UID}

# Install Python packages using mamba (faster conda) or pip
# Mamba is pre-installed in recent jupyter/datascience-notebook images
# Using mamba:
RUN mamba install --yes \
    'tabulate' \
    'plotly' \
    'pandas' \
    'tensorflow' \
    'pytorch' \
    'torchvision' \
    'torchaudio' \
    'xgboost' \
    'lightgbm' \
    'nltk' \
    'scipy' \
    'numpy' \
    'scikit-learn' \
    'matplotlib' \
    'seaborn' \
    'sqlalchemy' \
    'requests' \
    'beautifulsoup4' \
    'lxml' \
    'openpyxl' \
    # Add any other packages you need here, specifying versions if necessary e.g., 'pandas==1.5.3'
    && \
    mamba clean --all -f -y && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

# Example using pip (if a package is not on conda or you prefer pip for some):
# RUN pip install --no-cache-dir \
#     some-pip-package \
#     another-pip-package

# You can also install directly from a requirements.txt file
# COPY requirements.txt /tmp/
# RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Ensure permissions are set correctly for the jovyan user
# The base image already does a good job with this, but if you add many custom things,
# you might need to run fix-permissions again.
