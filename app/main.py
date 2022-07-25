from fastapi import FastAPI
from fastapi import Depends, HTTPException, status, Response

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}