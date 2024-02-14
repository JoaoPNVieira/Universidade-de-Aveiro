#########################################################################################
#########################################################################################
# ----------------- SECURE DATABASE - DROPS DB DATA - SIO PROJECT Nº 1 ---------------- #
#########################################################################################
#########################################################################################
# ------------------------------------------------------------------------------------- #
# -----                                                                           ----- #
import os
from db_tables import Base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

def drop_data(db_con_string):

    engine = create_engine(db_con_string, echo=True)
    Session = sessionmaker(bind=engine)
    db_session = Session()

    for table in reversed(Base.metadata.sorted_tables):
        db_session.query(table).delete()

    db_session.commit()
    db_session.close()

if __name__ == "__main__":
    directory = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(directory, 'DOSG26_SEC.db')
    db_con_string = f'sqlite:///{db_path}'

    drop_data(db_con_string)
    print("SUCCESS: Database data dropped!")
