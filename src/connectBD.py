import os

import MySQLdb
from dotenv import load_dotenv

from controller import Controller


class Connet:

    # variables and connection to databases
    def Con():
        load_dotenv()
        return MySQLdb.connect(
            host=os.getenv("DB_HOST"),
            port=int(os.getenv("DB_PORT")),
            user=os.getenv("DB_USER"),
            passwd=os.getenv("DB_PASSWORD"),
            db=os.getenv("DB_DATABASE"),
        )

    # json (fields, filters) is processed and it does query
    def query(fields, filters):
        db = Connet.Con()
        cur = db.cursor()

        Qfields = ",".join(fields)
        filters = Controller.jsonTOsql(filters)

        if len(fields) == 0:
            cur.execute(
                f"SELECT DISTINCT(id), address, city, price, description, year FROM property where id in (SELECT property_id FROM status_history where status_id in (SELECT id FROM status where name in ({filters[1]})))"
            )
        else:
            cur.execute(
                f"SELECT DISTINCT(id), {Qfields} FROM property where {filters[0]} id in (SELECT property_id FROM status_history where status_id in (SELECT id FROM status where name in ({filters[1]})))"
            )

        query = cur.fetchall()
        if len(query) == 0:
            db.close()
            return {"message:": "no records"}
        else:
            id = Controller.Extract_ids(query)

            cur.execute(
                f"""
                    SELECT DISTINCT(`property_id`) as Buildins, COUNT(`property_id`) AS Likes FROM `status_history` where property_id in ({id}) GROUP BY `property_id`
                """
            )

            db.close()
            return Controller.AddToResp(cur.fetchall(), query, fields)

    # add like record relating the client and the building
    def AddLike(IdUser, IdBuilding):
        db = Connet.Con()
        cur = db.cursor()

        try:
            # cur.execute(
            #     f"INSERT INTO properties property_id={IdBuilding}, status_id={IdUser}"
            # )
            return {"message:": "successful"}
        except Exception:
            db.close()
            return {"message:": "error in the query"}
