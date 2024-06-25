import requests

# URL of the Flask application
url = 'http://127.0.0.1:5000/predict'

# Path to the image file you want to send
file_path = r'C:\Users\seifh\IdeaProjects\Grad\HieroSecret\GP\M19_png.rf.9abd9fdd570c6db0c78e99b68d14593e_21.jpg'

# Open the file and send it in a POST request
with open(file_path, 'rb') as img:
    files = {'file': img}
    response = requests.post(url, files=files)
    try:
        print(response.json())
    except requests.exceptions.JSONDecodeError:
        print("Error decoding JSON response")
        print(response.text)
