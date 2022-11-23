# Office Spaces
This is a Office space booking Website :computer:


## Technologies
1. Flask (Backend)
3. CSS (Frontend)
4. JavaScript (Client-Side)


## To Run This Project

1. clone this project on your local machine,
```
git clone https://github.com/sanketsultan/open-office
```
2. create a virtual environment inside eCommerce folder,
```
virtualenv .venv
```
3. activate virtual environment,(for windows)
```
.\venv\Scripts\activate 
```
4. install project dependencies from requirements.txt,
```
pip install -r requirements.txt
```
5. run project on your local machine,
```
python python app.py
```

## Run via Docker

docker pull and run
```
docker run vison91/office_spaces
```
The webpage should be visible on following url
```
http://127.0.0.1:5000/
```

## Build docker file
docker build
```
docker build -t office_spaces .
```
run the docker image
```
docker run -p 5000:5000 --name=office_spaces office_spaces
```
## Update docker image
push the changes
```
docker tag <image_name> vison91/office_spaces
docker push <username>/<repository name>
```
