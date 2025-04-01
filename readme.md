##What is a Virtual Environment (venv) in Python?

A virtual environment in Python is an isolated workspace that allows you to install dependencies for a specific project without affecting the system-wide Python installation or other projects. This is useful when working on multiple projects with different package versions.
Why Use a Virtual Environment?

    Dependency Isolation – Prevents conflicts between projects using different package versions.

    Avoids System Pollution – Keeps the global Python environment clean.

    Reproducibility – Makes it easy to recreate the same environment on another machine.

    Better Version Management – Different projects can use different Python or library versions.

How to Create and Use a Virtual Environment
Step 1: Install venv (if not already installed)

venv is included in Python 3.3+ by default. To verify, run:

python3 -m ensurepip --default-pip

Step 2: Create a Virtual Environment

Navigate to your project folder and run:

python3 -m venv myenv # Creates a virtual environment named 'myenv'

This will create a folder myenv/ containing:

    A Python interpreter specific to this environment.

    A site-packages directory for dependencies.

    Scripts for activating/deactivating the environment.

Step 3: Activate the Virtual Environment

    Windows (cmd/PowerShell)

myenv\Scripts\activate

Mac/Linux (bash/zsh)

    source myenv/bin/activate

Once activated, you’ll see (myenv) in the terminal prompt, indicating the virtual environment is active.
Step 4: Install Packages Inside the Virtual Environment

Use pip to install dependencies:

pip install flask pandas numpy

To list installed packages:

pip list

Step 5: Deactivate the Virtual Environment

To exit the virtual environment:

deactivate

This returns you to the system’s default Python environment.
Removing a Virtual Environment

To delete a virtual environment, simply remove the folder:

rm -rf myenv # Mac/Linux
rmdir /s /q myenv # Windows

Using a Virtual Environment in a Project

If you share your project, include a requirements.txt file:

pip freeze > requirements.txt

To recreate the environment on another system:

python3 -m venv myenv
source myenv/bin/activate # Activate it
pip install -r requirements.txt

Alternative Virtual Environment Tools

    venv – Built-in and lightweight (Recommended for most projects).

    virtualenv – Similar but supports older Python versions.

    pipenv – Manages both environments and dependencies (Pipfile instead of requirements.txt).

    conda – Used mainly for data science projects (Anaconda distribution).
