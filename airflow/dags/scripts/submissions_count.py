import psycopg2
import os

def update_mv():
    conn = psycopg2.connect(dbname=os.getenv("POSTGRES_DB"),
                        user=os.getenv("POSTGRES_USER"),
                        password=os.getenv("POSTGRES_PASSWORD"),
                        port=os.getenv("POSTGRES_PORT"),
                        host=os.getenv("POSTGRES_HOST"))

    cur = conn.cursor()
    cur.execute("refresh materialized view submissions_count ")
    conn.commit()
    cur.close()

