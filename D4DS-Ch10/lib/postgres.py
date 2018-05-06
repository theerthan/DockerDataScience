import psycopg2 as pg2

def connect_to_postgres():
    """ Pre-configured to connect to PostgreSQL running on the same system.
        Returns connection and cursor
        
        con,cur = connect_to_postgres()
    """
    con = pg2.connect(host='this_postgres',user='postgres',database='postgres')
    return con, con.cursor()
    