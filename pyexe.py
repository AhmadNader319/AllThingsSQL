def read_sql_file(file_path):
    try:
        with open(file_path, "r") as file:
            return file.read()
    except:
        print(f"Error: File not found at {file_path}")

if __name__ == "__main__":
    file_name = "sql_queries.sql"  
    sql_queries = read_sql_file(file_name)

    if sql_queries:
        print("Content of the SQL file:")
        print(sql_queries)
