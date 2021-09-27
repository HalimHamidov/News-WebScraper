import psycopg2
import psycopg2.extras 
from connect import *
import pandas as pd
# import os

# Establishing the connection
conn = psycopg2.connect(
   database="news_db",
   user="postgres", 
   password="postgres"
)

# sql.write_frame(df, 'news_items_dt' , conn, flavor='postgresql')
# # conn = psycopg2.connect('dbname=news_db user=postgres password=postgres host=/tmp/')
# #Setting auto commit false
# conn.autocommit = True

# #Creating a cursor object using the cursor() method
# cursor = conn.cursor()



# if len(df) > 0:
#     df_columns = list(df)
#     # create (col1,col2,...)
#     columns = ','.join(df_columns)

#     # create VALUES('%s', '%s",...) one '%s' per column
#     values = "VALUES({})".format(','.join('%s' for _ in df_columns)) 

#     #create INSERT INTO table (columns) VALUES('%s',...)
#     insert_stmt = "INSERT INTO {} ({}) {}".format('news_items_dt',columns,values)

#     cur = conn.cursor()
#     psycopg2.extras.execute_batch(cur, insert_stmt, df.values)
#     conn.commit()
#     cur.close()
#    #  title TEXT,
#    #  description TEXT,
#    #  link TEXT,
#    #  pubDate TEXT

# # Commit your changes in the database
# # conn.commit()
# print("Records inserted........")

# # Closing the connection
# # conn.close()



# engine = create_engine('postgresql://postgres:postgres@localhost:5432/news_db')

# df.to_sql("news_items_dt", conn)
# import sql  # the patched version (file is named sql.py)
# sql.write_frame(df, 'news_items_dt', conn, flavor='postgresql')

# def execute_values(conn, df, table):
#     """
#     Using psycopg2.extras.execute_values() to insert the dataframe
#     """
#     # Create a list of tupples from the dataframe values
#     tuples = [tuple(x) for x in df.to_numpy()]
#     # Comma-separated dataframe columns
#     cols = ','.join(list(df.columns))
#     # SQL quert to execute
#     query  = "INSERT INTO %s(%s) VALUES %%s" % (table, cols)
#     cursor = conn.cursor()
#     try:
#         psycopg2.extras.execute_values(cursor, query, tuples)
#         conn.commit()
#     except (Exception, psycopg2.DatabaseError) as error:
#         print("Error: %s" % error)
#         conn.rollback()
#         cursor.close()
#         return 1
#     print("execute_values() done")
#     cursor.close()

# execute_values(conn, df, 'news_items_dt')
# conn.close()


# def copy_from_file(conn, df, table):
#     """
#     Here we are going save the dataframe on disk as 
#     a csv file, load the csv file  
#     and use copy_from() to copy it to the table
#     """
#     # Save the dataframe to disk
#     tmp_df = "data/tmp_dataframe.csv"
#     df.to_csv(tmp_df, index_label='id', header=False)
#     f = open(tmp_df, 'r')
#     cursor = conn.cursor()
#     try:
#         cursor.copy_from(f, table, sep=",")
#         conn.commit()
#     except (Exception, psycopg2.DatabaseError) as error:
#         os.remove(tmp_df)
#         print("Error: %s" % error)
#         conn.rollback()
#         cursor.close()
#         return 1
#     print("copy_from_file() done")
#     cursor.close()
#     os.remove(tmp_df)
    
# #-----------------------------------------------
# # Main code
# #-----------------------------------------------

# copy_from_file(conn, df, 'news_items_dt') # copy the dataframe to SQL
# conn.close() # close the connection

from io import StringIO

def copy_from_stringio(conn, df, table):
    """
    Here we are going save the dataframe in memory 
    and use copy_from() to copy it to the table
    """
    # save dataframe to an in memory buffer
    buffer = StringIO()
    df.to_csv(buffer, index_label='id', header=False)
    buffer.seek(0)
    
    cursor = conn.cursor()
    try:
        cursor.copy_from(buffer, table, sep=",")
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        
        print("Error: %s" % error)
        conn.rollback()
        cursor.close()
        return 1
    print("copy_from_stringio() done")
    cursor.close()
    
#-----------------------------------------------
# Main code
#-----------------------------------------------
copy_from_stringio(conn, df, 'news_items_dt') # copy the dataframe to SQL
conn.close() # close the connection