from fastapi import FastAPI

app = FastAPI()

# Root endpoint example
@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI project!"}
