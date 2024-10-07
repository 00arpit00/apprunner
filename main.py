import fastapi, uvicorn, os

app = fastapi.FastAPI()

print("Starting webserver...")
uvicorn.run(
    app,
    host="0.0.0.0",
    port=8000,
    debug=os.getenv("DEBUG", True),
    log_level=os.getenv('LOG_LEVEL', "debug")
)
# Root endpoint example
@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI project!"}
