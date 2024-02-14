#########################################################################################
#########################################################################################
# ----------------- SECURE DATABASE - DROP DB SCHEMA - SIO PROJECT Nº 1 --------------- #
#########################################################################################
#########################################################################################
# ------------------------------------------------------------------------------------- #
# -----                                                                           ----- #
import os
from sqlalchemy import create_engine
from db_tables import Base

def drop_tables(db_con_string):

    engine = create_engine(db_con_string, echo=True)
    Base.metadata.drop_all(engine)

if __name__ == "__main__":
    directory = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(directory, 'DOSG26_SEC.db')
    db_con_string = f'sqlite:///{db_path}'

    drop_tables(db_con_string)
    print("SUCCESS: Database Schema has been dropped!")

