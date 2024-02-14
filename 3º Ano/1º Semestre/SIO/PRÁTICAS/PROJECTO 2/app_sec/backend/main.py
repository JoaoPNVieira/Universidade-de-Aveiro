from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from db_tables import Base
from db_inserts import insert_data
import os
from drop_schema import drop_tables

def init_database(db_con_string):
    # CREATE THE ENGINE
    engine = create_engine(db_con_string, echo=True)

    # CREATE TABLES
    Base.metadata.create_all(bind=engine)

    # CREATE A SESSION 
    Session = sessionmaker(bind=engine)
    db_session = Session()

    # INSERT DATA
    insert_data(db_session)

if __name__ == "__main__":
    directory = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(directory, 'DOSG26_SEC.db')
    db_con_string = f'sqlite:///{db_path}'

    drop_tables(db_con_string)
    init_database(db_con_string)
    print("SUCCESS: Database tables created!")


      