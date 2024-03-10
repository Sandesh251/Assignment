# MathBuddy

### Cloning the repository

--> Clone the repository using the command below :

```bash
git clone https://github.com/dhanbdrkarki1/mathbuddy-cloud.git

```

--> Move into the directory where we have the project files :

```bash
cd mathbuddy-cloud

```

--> Create a virtual environment :

```bash
# install virtualenv first
pip install virtualenv

# create virtual environment
virtualenv venv

```

--> Activate the virtual environment :

```bash
venv\scripts\activate

```

--> Install the requirements :

```bash
pip install -r requirements.txt

```

#

### Database Setup

--> Open xampp server & start apache and mysql.
--> Click on admin button in the mysql row to open UI
--> Click on import from the UI.
--> Choose file: mathbuddy.sql and the click import.

#

### Running the App

--> To run the App, we use :

```bash
python manage.py runserver

```

> ⚠ Open the link in browser: http://127.0.0.1:8000/
