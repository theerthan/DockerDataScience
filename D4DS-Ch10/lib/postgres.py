import psycopg2 as pg2

def connect_to_postgres():
    """ Pre-configured to connect to PostgreSQL running on the same system.
        Returns connection and cursor
        
        con,cur = connect_to_postgres()
    """
    con = pg2.connect(host='this_postgres',user='postgres',database='postgres')
    return con, con.cursor()
    
def encode_target(_id):
    con, cur = connect_to_postgres()
    cur.execute("""SELECT _id, income_label FROM adult WHERE _id = {};
    """.format(_id))
    this_id,income_label = cur.fetchone()
    assert this_id == _id
    
    greater_than_50k = (income_label == ' >50K')
    
    cur.execute("""
        BEGIN;
        UPDATE adult
        SET target = {}
        WHERE _id = {};
        COMMIT;
        """.format(greater_than_50k,_id))

    con.close()
