from fastapi import FastAPI
from app.api.v1.endpoints import hello_world, assignments

app = FastAPI()

# Include the hello_world router
app.include_router(hello_world.router)

# Include the assignments' router
app.include_router(assignments.router)

# Root endpoint example
@app.get("/")
def read_root():
    return {"message": "Welcome to the FastAPI project!"}
