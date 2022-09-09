import json


class Controller:

    # validate that the fields are not empty to make the query
    def validateFilers(a):
        for i in a:
            if a[i] == "":
                return False
        return True

    # organize the response with the query data a=> querySearch  b=> queryLike  c=> fields
    def AddToResp(a, b, c):

        if len(c) == 0:
            c = ["id", "address", "city", "price", "description", "year", "likes"]
        else:
            c.insert(0, "id")
            c.append("likes")
            c = list(c)

        res = []
        for i in range(len(b)):
            x = {}
            ql = list(b[i])  # convierte en lista para manipular
            if b[i][1] != "":
                ql.append(a[i][1])  # inserta el valor en la lista que esta la posición i
                for q in range(len(c)):
                    x[c[q]] = ql[q]  # le asigna la Key a cada valor
            res.append(x)
        return res

    # extract the id of the buildings to perform likes query
    def Extract_ids(a):

        id = ""
        for i in a:
            if a[len(a) - 1][0] == i[0]:
                id += str(i[0])
            else:
                id += str(i[0]) + ","
        return id

    # takes the array and converts it to a valid string for basic sql statement
    def jsonTOsql(a):

        if len(a) == 0:
            a = " "
            b = "'pre_venta', 'en_venta', 'vendido'"
        else:
            if "state" in a:
                b = str(a["state"])
                b = b.replace("}", "")
                b = b.replace('{"', "")
                b = "'" + b + "'"
                a.pop("state")
            else:
                b = "'pre_venta', 'en_venta', 'vendido'"

            a = json.dumps(a)
            a = a.replace("}", "")
            a = a.replace('{"', "")
            a = a.replace('":', "=")
            a = a.replace(', "', " and ")
            a = a + " and "

        return [str(a), str(b)]
