### orm outside the context ###

```comsole
>>> from sqlalchemy.orm import scoped_session, sessionmaker
>>> from sqlalchemy import create_engine

>>> psql_engine = create_engine("postgresql://user:password@host:5432",echo=False,pool_size=10,max_overflow=10)
>>> Session = scoped_session(sessionmaker(bind=psql_engine))
session = Session()```


