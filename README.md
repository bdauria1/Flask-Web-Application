# Flask Web Application

This is a basic Flask web application with routes for user authentication (login and signup), file upload, and profile management.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Contributing](#contributing)

## Project Overview

This web application serves as a template for user authentication and file upload functionality using Flask, a lightweight Python web framework. The app currently contains placeholder routes for user signup, login, and profile management. Additional database functionality (e.g., SQL integration) and file handling can be implemented in these routes.

## Features
- User signup with basic validation
- User login with session handling
- Profile page for logged-in users
- Image upload functionality with file type validation
- Error handling and secure file handling using Flask and Werkzeug

## Prerequisites
- Python 3.7+
- Flask
- Flask-Login (for user authentication, if needed in the future)
- MySQL (if planning to use MySQL for database storage)

## Authors and Acknowledgments

- **Brandon Dauria** - [GitHub Profile](https://github.com/yourusername)
- **Brooke Potvin** - Contributed to the development of authentication and file upload features.


## Installation

1. **Clone the repository:**
   ```
   git clone https://github.com/yourusername/your-repo-name.git
   cd your-repo-name
   ```

2. **Create a virtual enviorment:**
   ```
   python3 -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. **Install Dependencies:**
   ```
   pip install -r requirements.txt
   ```

4. **Set up enviorment variables:**
   - Set up a .env file with your database credentials and secret keys if needed.
   - Example .env file:
   ```plaintext
   FLASK_SECRET_KEY=your_secret_key
   DATABASE_URL=mysql://username:password@localhost/db_name
   ```
5. **Database Setup (Optional):**
   - Create the necessary tables in your database for user storage and other application data.

## Usage

1. **Run the application:**
   ```
      flask run
   ```

   By default, the application will run on http://127.0.0.1:5000.

2. **Access the web application:**
   - Navigate to http://127.0.0.1:5000 to access the app.
   - Use the /signup route to create a new account and /login to log in.

## Project Structure

```
your-repo-name/
├── app.py                   # Main Flask application
├── templates/               # HTML templates for the application
│   ├── welcome.html         # Welcome page template
│   ├── login.html           # Login page template
│   ├── signup.html          # Signup page template
│   ├── unauth.html          # Unauthorized page template
│   └── hello.html           # Profile page template for logged-in users
├── static/                  # Static files (CSS, JS, images)
├── README.md                # Project documentation
├── requirements.txt         # Python dependencies
└── .env                     # Environment variables (not included in version control)
```

## Contributing
1. Fork the repository.

2. Create a new branch for your feature (git checkout -b feature-name).

3. Commit your changes (git commit -m 'Add a feature').
Push to the branch (git push origin feature-name).

4. Open a pull request.