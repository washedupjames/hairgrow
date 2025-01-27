#!/usr/bin/env bash
# This script will run during the build phase of Render deployment

# Exit immediately if a command exits with a non-zero status
set -o errexit

# Install dependencies
pip install -r requirements.txt

# Collect static files
python manage.py collectstatic --noinput

# Run migrations (if needed)
python manage.py migrate

# Start your application
gunicorn ecommerce.wsgi:application