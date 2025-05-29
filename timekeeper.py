from flask import Flask, render_template, request, redirect
import sqlite3
from datetime import datetime

app = Flask(__name__)

# Database init
def init_db():
    with sqlite3.connect("timeclock.db") as conn:
        conn.execute('''
            CREATE TABLE IF NOT EXISTS time_logs (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                employee_id TEXT NOT NULL,
                clock_in DATETIME,
                clock_out DATETIME
            )
        ''')

@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        employee_id = request.form["employee_id"]
        action = request.form["action"]

        with sqlite3.connect("timeclock.db") as conn:
            now = datetime.now()

            if action == "clock_in":
                conn.execute("INSERT INTO time_logs (employee_id, clock_in) VALUES (?, ?)",
                             (employee_id, now))
            elif action == "clock_out":
                conn.execute("""
                    UPDATE time_logs
                    SET clock_out = ?
                    WHERE employee_id = ? AND clock_out IS NULL
                    ORDER BY clock_in DESC
                    LIMIT 1
                """, (now, employee_id))

        return redirect("/")
    return render_template("index.html")

if __name__ == "__main__":
    init_db()
    app.run(debug=True)
