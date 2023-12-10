from flask import Flask, render_template
import psutil

app = Flask(__name__)

@app.route('/')
def index():
    # Get system usage information
    cpu_percent = psutil.cpu_percent()
    memory_info = psutil.virtual_memory()

    # Render the template with system usage information
    return render_template('index.html', cpu_percent=cpu_percent, memory_info=memory_info)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8060)
